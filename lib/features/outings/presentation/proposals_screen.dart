import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/router/app_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/sun_loader.dart';
import '../domain/place_proposal.dart';
import 'outing_planner_providers.dart';
import 'widgets/proposal_card.dart';
import 'widgets/proposal_cta_bar.dart';
import 'widgets/proposal_header.dart';
import 'widgets/proposal_message.dart';
import 'widgets/proposal_recap.dart';

/// Étape 2 sur 2 : choisir un lieu parmi les propositions classées.
class ProposalsScreen extends ConsumerStatefulWidget {
  const ProposalsScreen({super.key});

  @override
  ConsumerState<ProposalsScreen> createState() => _ProposalsScreenState();
}

class _ProposalsScreenState extends ConsumerState<ProposalsScreen> {
  static const List<Color> _thumbColors = [
    AppColors.ideeSable,
    AppColors.ideeLavande,
    AppColors.ideeSauge,
  ];

  String? _selectedId;

  void _back() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.newOuting);
    }
  }

  // Envoi fictif tant que l'API n'existe pas : on revient à l'accueil.
  void _submit() {
    context.go(AppRoutes.home);
    ref.read(outingDraftControllerProvider.notifier).reset();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final proposals = ref.watch(outingProposalsProvider);
    final list = proposals.value;
    final hasSelection = list != null && list.any((p) => p.id == _selectedId);
    final showCta = list != null && list.isNotEmpty;
    return Scaffold(
      backgroundColor: AppColors.blanc,
      body: SafeArea(
        bottom: !showCta,
        child: Column(
          children: [
            Expanded(
              child: proposals.when(
                skipError: true,
                loading: () => _Frame(
                  onBack: _back,
                  child: Center(
                    child: SunLoader(
                      semanticLabel: l10n.loadingLabel,
                      width: AppDimens.loaderWidth,
                    ),
                  ),
                ),
                error: (_, _) => _Frame(
                  onBack: _back,
                  child: ProposalMessage(
                    body: l10n.proposalsErrorBody,
                    actionLabel: l10n.errorRetry,
                    actionVariant: AppButtonVariant.strong,
                    onAction: () => ref.invalidate(outingProposalsProvider),
                  ),
                ),
                data: (data) => data.isEmpty
                    ? _Frame(
                        onBack: _back,
                        child: ProposalMessage(
                          title: l10n.proposalsEmptyTitle,
                          body: l10n.proposalsEmptyBody,
                          actionLabel: l10n.proposalsEmptyAction,
                          actionVariant: AppButtonVariant.strong,
                          onAction: _back,
                        ),
                      )
                    : _Frame(onBack: _back, child: _list(data)),
              ),
            ),
            if (showCta)
              ProposalCtaBar(onSubmit: hasSelection ? _submit : null),
          ],
        ),
      ),
    );
  }

  Widget _list(List<PlaceProposal> data) {
    return Column(
      children: [
        for (var i = 0; i < data.length; i++) ...[
          if (i > 0) const SizedBox(height: AppDimens.homeTightGap),
          ProposalCard(
            proposal: data[i],
            thumbColor: _thumbColors[i % _thumbColors.length],
            selected: data[i].id == _selectedId,
            onSelected: () => setState(() => _selectedId = data[i].id),
          ),
        ],
      ],
    );
  }
}

/// En-tête, titre et rappel du brouillon, puis le contenu de l'état courant.
class _Frame extends ConsumerWidget {
  const _Frame({required this.onBack, this.child});

  final VoidCallback onBack;

  /// Contenu défilant sous le rappel.
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final draft = ref.watch(outingDraftControllerProvider);
    final top = <Widget>[
      ProposalHeader(onBack: onBack),
      const SizedBox(height: AppDimens.homeTightGap),
      Semantics(
        header: true,
        child: Text(
          l10n.proposalsHeading,
          style: AppTextStyles.proposalsHeading,
        ),
      ),
      const SizedBox(height: AppDimens.homeBlockGap),
      ProposalRecap(draft: draft),
      const SizedBox(height: AppDimens.homeBlockGap),
    ];
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppDimens.contentMaxWidth),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppDimens.homeSidePadding,
            0,
            AppDimens.homeSidePadding,
            AppDimens.proposalListBottomPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [...top, ?child],
          ),
        ),
      ),
    );
  }
}

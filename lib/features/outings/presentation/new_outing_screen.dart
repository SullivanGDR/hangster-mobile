import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/router/app_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../shared/widgets/sun_loader.dart';
import '../../onboarding/domain/taste_preferences.dart';
import 'outing_planner_providers.dart';
import 'widgets/new_outing_choice_chip.dart';
import 'widgets/new_outing_cta.dart';
import 'widgets/new_outing_slot_card.dart';
import 'widgets/new_outing_wish_field.dart';

/// Nouvelle sortie, étape 1 sur 2 : groupe, créneau, envie, critères.
class NewOutingScreen extends ConsumerWidget {
  const NewOutingScreen({super.key});

  static const List<int> _travelChoices = [15, 30, 45];

  void _close(BuildContext context, WidgetRef ref) {
    ref.read(outingDraftControllerProvider.notifier).reset();
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final canContinue = ref.watch(
      outingDraftControllerProvider.select(
        (d) => d.group != null && d.slot != null,
      ),
    );
    final groups = ref.watch(outingGroupsProvider);
    return Scaffold(
      backgroundColor: AppColors.blanc,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppDimens.contentMaxWidth,
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: const EdgeInsets.only(
                      top: AppDimens.outingTopPadding,
                      bottom: AppDimens.outingSectionGap,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Padded(
                          child: _TopRow(onClose: () => _close(context, ref)),
                        ),
                        const SizedBox(height: AppDimens.outingSectionGap),
                        _Padded(
                          child: Semantics(
                            header: true,
                            child: Text(
                              l10n.newOutingHeading,
                              style: AppTextStyles.outingHeading,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppDimens.outingSectionGap),
                        groups.when(
                          loading: () => _Loading(label: l10n.loadingLabel),
                          error: (_, _) => _Padded(
                            child: _ErrorBlock(
                              onRetry: () =>
                                  ref.invalidate(outingGroupsProvider),
                            ),
                          ),
                          data: (list) => list.isEmpty
                              ? _Padded(
                                  child: Text(
                                    l10n.newOutingGroupsEmpty,
                                    style: AppTextStyles.body,
                                  ),
                                )
                              : const _Form(),
                        ),
                      ],
                    ),
                  ),
                ),
                NewOutingCta(
                  label: l10n.newOutingSubmit,
                  onPressed: canContinue
                      ? () => context.push(AppRoutes.proposals)
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Padded extends StatelessWidget {
  const _Padded({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppDimens.homeSidePadding),
    child: child,
  );
}

class _TopRow extends StatelessWidget {
  const _TopRow({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Semantics(
          button: true,
          label: l10n.newOutingClose,
          excludeSemantics: true,
          onTap: onClose,
          child: InkWell(
            onTap: onClose,
            customBorder: const CircleBorder(),
            child: SizedBox.square(
              dimension: AppDimens.minTouchTarget,
              child: Center(
                child: Container(
                  width: AppDimens.outingCloseSize,
                  height: AppDimens.outingCloseSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.ligne,
                      width: AppDimens.borderWidth,
                    ),
                  ),
                  child: const Icon(
                    LucideIcons.x,
                    size: AppDimens.outingCloseIconSize,
                    color: AppColors.encre,
                  ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Text(
            l10n.newOutingStepLabel,
            style: AppTextStyles.date,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => _Padded(
    child: Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.outingLegendGap),
      child: Semantics(
        header: true,
        child: Text(text, style: AppTextStyles.legend),
      ),
    ),
  );
}

class _Loading extends StatelessWidget {
  const _Loading({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(AppDimens.spaceL),
      child: SunLoader(
        semanticLabel: label,
        width: AppDimens.outingLoaderWidth,
      ),
    ),
  );
}

class _ErrorBlock extends StatelessWidget {
  const _ErrorBlock({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.newOutingLoadError,
          style: AppTextStyles.body.copyWith(color: AppColors.encreDouce),
        ),
        const SizedBox(height: AppDimens.spaceM),
        // Action secondaire : le seul bouton principal est le CTA du bas.
        OutlinedButton(
          onPressed: onRetry,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(
              AppDimens.minTouchTarget,
              AppDimens.minTouchTarget,
            ),
            foregroundColor: AppColors.encre,
            side: const BorderSide(color: AppColors.ligne),
            shape: const StadiumBorder(),
          ),
          child: Text(l10n.errorRetry),
        ),
      ],
    );
  }
}

class _Form extends ConsumerWidget {
  const _Form();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final controller = ref.read(outingDraftControllerProvider.notifier);
    final groups = ref.watch(outingGroupsProvider).value ?? const [];
    final draft = ref.watch(outingDraftControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Legend(l10n.newOutingGroupLegend),
        NewOutingChipRow(
          children: [
            for (final g in groups)
              NewOutingChoiceChip(
                label: l10n.newOutingGroupChip(g.name, g.memberCount),
                selected: draft.group?.id == g.id,
                onTap: () => controller.selectGroup(g),
              ),
          ],
        ),
        const SizedBox(height: AppDimens.outingSectionGap),
        _Legend(l10n.newOutingSlotsLegend),
        const _SlotsSection(),
        const SizedBox(height: AppDimens.outingSectionGap),
        _Legend(l10n.newOutingWishLabel),
        const _Padded(child: NewOutingWishField()),
        const SizedBox(height: AppDimens.outingSectionGap),
        _Legend(l10n.newOutingBudgetLegend),
        NewOutingChipRow(
          children: [
            for (final b in BudgetRange.values)
              NewOutingChoiceChip(
                label: _budgetLabel(l10n, b),
                selected: draft.criteria.budget == b,
                onTap: () => controller.setBudget(b),
              ),
          ],
        ),
        const SizedBox(height: AppDimens.outingSectionGap),
        _Legend(l10n.newOutingTravelLegend),
        NewOutingChipRow(
          children: [
            for (final m in NewOutingScreen._travelChoices)
              NewOutingChoiceChip(
                label: l10n.newOutingTravelOption(m),
                selected: draft.criteria.maxTravelMinutes == m,
                onTap: () => controller.setMaxTravelMinutes(m),
              ),
          ],
        ),
      ],
    );
  }

  static String _budgetLabel(AppLocalizations l10n, BudgetRange b) =>
      switch (b) {
        BudgetRange.under15 => l10n.onboardingBudgetUnder15,
        BudgetRange.from15to30 => l10n.onboardingBudgetFrom15to30,
        BudgetRange.from30to50 => l10n.onboardingBudgetFrom30to50,
        BudgetRange.over50 => l10n.onboardingBudgetOver50,
      };
}

class _SlotsSection extends ConsumerWidget {
  const _SlotsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final hasGroup = ref.watch(
      outingDraftControllerProvider.select((d) => d.group != null),
    );
    if (!hasGroup) {
      return _Padded(
        child: Text(
          l10n.newOutingSlotsPickGroup,
          style: AppTextStyles.body.copyWith(color: AppColors.gris),
        ),
      );
    }
    final selected = ref.watch(
      outingDraftControllerProvider.select((d) => d.slot),
    );
    return ref
        .watch(outingSlotsProvider)
        .when(
          loading: () => _Loading(label: l10n.loadingLabel),
          error: (_, _) => _Padded(
            child: _ErrorBlock(
              onRetry: () => ref.invalidate(outingSlotsProvider),
            ),
          ),
          data: (slots) {
            if (slots.isEmpty) {
              return _Padded(
                child: Text(
                  l10n.newOutingSlotsEmpty,
                  style: AppTextStyles.body.copyWith(color: AppColors.gris),
                ),
              );
            }
            final controller = ref.read(outingDraftControllerProvider.notifier);
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.homeSidePadding,
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = 0; i < slots.length; i++) ...[
                      if (i > 0) const SizedBox(width: AppDimens.outingChipGap),
                      NewOutingSlotCard(
                        slot: slots[i],
                        selected: selected == slots[i],
                        onTap: () => controller.selectSlot(slots[i]),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        );
  }
}

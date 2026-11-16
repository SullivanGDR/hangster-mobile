import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/router/app_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/errors/api_failure.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/hangster_logo.dart';
import '../../../shared/widgets/sun_loader.dart';
import '../../auth/presentation/auth_providers.dart';
import '../domain/invitation_preview.dart';

/// Aperçu d'une invitation, sans nouvelle tentative automatique.
final invitationPreviewProvider = FutureProvider.autoDispose
    .family<InvitationPreview, String>(
      (ref, code) => ref.read(invitationRepositoryProvider).preview(code),
      retry: (_, _) => null,
    );

/// Écran d'invitation (deep link /i/<code>), public.
class InvitationScreen extends ConsumerStatefulWidget {
  const InvitationScreen({required this.code, super.key});

  final String code;

  @override
  ConsumerState<InvitationScreen> createState() => _InvitationScreenState();
}

class _InvitationScreenState extends ConsumerState<InvitationScreen> {
  static const double _maxContentWidth = 480;
  static const double _logoWidth = 140;

  bool _joining = false;
  bool _joinFailed = false;

  String get _target => AppRoutes.invitation(widget.code);

  Future<void> _join() async {
    setState(() {
      _joining = true;
      _joinFailed = false;
    });
    try {
      await ref.read(invitationRepositoryProvider).join(widget.code);
      if (mounted) context.go(AppRoutes.home);
    } on ApiFailure {
      if (mounted) {
        setState(() {
          _joining = false;
          _joinFailed = true;
        });
      }
    }
  }

  void _goTo(String path) => context.go(
    Uri(path: path, queryParameters: {'from': _target}).toString(),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final preview = ref.watch(invitationPreviewProvider(widget.code));
    final signedIn = ref.watch(authControllerProvider).value != null;

    final Widget body = preview.when(
      loading: () => Center(child: SunLoader(semanticLabel: l10n.loadingLabel)),
      error: (error, _) => error is ApiNotFound
          ? _Message(
              title: l10n.invitationNotFoundTitle,
              body: l10n.invitationNotFoundBody,
              actionLabel: l10n.invitationBackHome,
              onAction: () => context.go(AppRoutes.home),
            )
          : _Message(
              title: l10n.errorGeneric,
              actionLabel: l10n.errorRetry,
              onAction: () =>
                  ref.invalidate(invitationPreviewProvider(widget.code)),
            ),
      data: (data) => _Preview(
        preview: data,
        signedIn: signedIn,
        joining: _joining,
        joinFailed: _joinFailed,
        onPrimary: signedIn ? _join : () => _goTo(AppRoutes.login),
        onSignup: () => _goTo(AppRoutes.signup),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxContentWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppDimens.spaceL),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: HangsterLogo(
                      semanticLabel: l10n.appName,
                      width: _logoWidth,
                    ),
                  ),
                ),
                Expanded(child: body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Preview extends StatelessWidget {
  const _Preview({
    required this.preview,
    required this.signedIn,
    required this.joining,
    required this.joinFailed,
    required this.onPrimary,
    required this.onSignup,
  });

  final InvitationPreview preview;
  final bool signedIn;
  final bool joining;
  final bool joinFailed;
  final VoidCallback onPrimary;
  final VoidCallback onSignup;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimens.spaceL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.invitationHeading, style: AppTextStyles.bodyLarge),
          const SizedBox(height: AppDimens.spaceS),
          Text(preview.groupName, style: AppTextStyles.display),
          const SizedBox(height: AppDimens.spaceL),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.blanc,
              borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
              border: Border.all(
                color: AppColors.ligne,
                width: AppDimens.borderWidth,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.spaceM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.invitationMembers(preview.memberCount),
                    style: AppTextStyles.bodyLarge,
                  ),
                  if (preview.openVote) ...[
                    const SizedBox(height: AppDimens.spaceS),
                    Text(
                      l10n.invitationOpenVote,
                      style: AppTextStyles.label.copyWith(
                        color: AppColors.braiseTexte,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimens.spaceXl),
          if (joinFailed) ...[
            Text(
              l10n.invitationJoinError,
              style: AppTextStyles.body.copyWith(color: AppColors.braiseTexte),
            ),
            const SizedBox(height: AppDimens.spaceM),
          ],
          AppButton(
            label: signedIn ? l10n.invitationJoin : l10n.invitationSignInToJoin,
            onPressed: joining ? null : onPrimary,
          ),
          if (!signedIn) ...[
            const SizedBox(height: AppDimens.spaceS),
            TextButton(onPressed: onSignup, child: Text(l10n.invitationSignup)),
          ],
        ],
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    required this.title,
    required this.actionLabel,
    required this.onAction,
    this.body,
  });

  final String title;
  final String? body;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    final text = body;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimens.spaceL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: AppTextStyles.headline),
          if (text != null) ...[
            const SizedBox(height: AppDimens.spaceM),
            Text(text, style: AppTextStyles.bodyLarge),
          ],
          const SizedBox(height: AppDimens.spaceXl),
          AppButton(label: actionLabel, onPressed: onAction),
        ],
      ),
    );
  }
}

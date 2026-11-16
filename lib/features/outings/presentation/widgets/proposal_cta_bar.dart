import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../shared/widgets/app_button.dart';

/// Bouton principal collé en bas, désactivé tant que `onSubmit` est nul.
class ProposalCtaBar extends StatelessWidget {
  const ProposalCtaBar({required this.onSubmit, super.key});

  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.blanc,
        border: Border(
          top: BorderSide(
            color: AppColors.ligneNav,
            width: AppDimens.borderWidth,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppDimens.contentMaxWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimens.homeSidePadding,
                AppDimens.proposalCtaPaddingTop,
                AppDimens.homeSidePadding,
                AppDimens.proposalCtaPaddingBottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: AppDimens.proposalCtaHeight,
                    child: AppButton(
                      label: l10n.proposalsSubmit,
                      onPressed: onSubmit,
                    ),
                  ),
                  const SizedBox(height: AppDimens.spaceS),
                  Text(
                    l10n.proposalsSubmitCaption,
                    style: AppTextStyles.meta,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

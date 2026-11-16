import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../l10n/generated/app_localizations.dart';

/// Retour à gauche, « Étape 2 sur 2 » à droite.
class ProposalHeader extends StatelessWidget {
  const ProposalHeader({required this.onBack, super.key});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Semantics(
          button: true,
          label: l10n.proposalsBack,
          excludeSemantics: true,
          child: InkResponse(
            onTap: onBack,
            radius: AppDimens.minTouchTarget / 2,
            child: const SizedBox.square(
              dimension: AppDimens.minTouchTarget,
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: AppColors.ligne,
                        width: AppDimens.borderWidth,
                      ),
                    ),
                  ),
                  child: SizedBox.square(
                    dimension: AppDimens.backButtonSize,
                    child: Icon(
                      LucideIcons.chevronLeft,
                      size: AppDimens.bellIconSize,
                      color: AppColors.encre,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Text(
            l10n.proposalsStep,
            style: AppTextStyles.date,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

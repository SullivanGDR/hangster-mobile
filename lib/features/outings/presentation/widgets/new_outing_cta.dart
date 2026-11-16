import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';

/// Barre d'action fixée en bas : un seul bouton principal Braise.
class NewOutingCta extends StatelessWidget {
  const NewOutingCta({required this.label, required this.onPressed, super.key});

  final String label;

  /// Null désactive le bouton.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppDimens.homeSidePadding,
          AppDimens.outingCtaPaddingTop,
          AppDimens.homeSidePadding,
          AppDimens.outingCtaPaddingBottom,
        ),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: onPressed,
            style: ButtonStyle(
              minimumSize: const WidgetStatePropertyAll(
                Size.fromHeight(AppDimens.outingCtaHeight),
              ),
              elevation: const WidgetStatePropertyAll(0),
              shadowColor: const WidgetStatePropertyAll(Colors.transparent),
              surfaceTintColor: const WidgetStatePropertyAll(
                Colors.transparent,
              ),
              shape: const WidgetStatePropertyAll(StadiumBorder()),
              backgroundColor: WidgetStatePropertyAll(
                enabled ? AppColors.braise : AppColors.ligne,
              ),
              foregroundColor: WidgetStatePropertyAll(
                enabled ? AppColors.encre : AppColors.gris,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyStrong.copyWith(
                      color: enabled ? AppColors.encre : AppColors.gris,
                    ),
                  ),
                ),
                const SizedBox(width: AppDimens.outingCtaIconGap),
                const Icon(
                  LucideIcons.arrowRight,
                  size: AppDimens.outingCtaIconSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

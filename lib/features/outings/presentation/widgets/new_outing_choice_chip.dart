import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';

/// Pilule de choix simple : Encre/blanc quand elle est sélectionnée.
/// La zone cliquable fait au moins 48 dp de haut.
class NewOutingChoiceChip extends StatelessWidget {
  const NewOutingChoiceChip({
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.radiusPill),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: AppDimens.minTouchTarget,
            minWidth: AppDimens.minTouchTarget,
          ),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(
                minHeight: AppDimens.outingChipHeight,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.outingChipPaddingH,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? AppColors.encre : AppColors.blanc,
                borderRadius: BorderRadius.circular(AppDimens.radiusPill),
                border: selected
                    ? null
                    : Border.all(
                        color: AppColors.ligne,
                        width: AppDimens.borderWidth,
                      ),
              ),
              child: Text(
                label,
                style: selected
                    ? AppTextStyles.bodyStrong.copyWith(color: AppColors.blanc)
                    : AppTextStyles.body,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Rangée horizontale défilante de pilules, qui déborde jusqu'au bord.
class NewOutingChipRow extends StatelessWidget {
  const NewOutingChipRow({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.homeSidePadding,
      ),
      child: Row(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) const SizedBox(width: AppDimens.outingChipGap),
            children[i],
          ],
        ],
      ),
    );
  }
}

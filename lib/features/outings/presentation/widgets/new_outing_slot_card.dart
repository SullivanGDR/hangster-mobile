import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/time_slot.dart';

/// Carte de créneau. Quand tout le monde est libre, le décompte est mis en
/// avant (fond Braise douce, texte Braise).
class NewOutingSlotCard extends StatelessWidget {
  const NewOutingSlotCard({
    required this.slot,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final TimeSlot slot;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final day = l10n.newOutingSlotDay(slot.start);
    final free = l10n.newOutingSlotFree(slot.freeCount, slot.totalCount);
    final highlight = slot.everyoneFree;
    final padding = selected
        ? AppDimens.outingSlotPaddingSelected
        : AppDimens.outingSlotPaddingRest;
    return Semantics(
      button: true,
      selected: selected,
      label: '$day, ${slot.label}, $free',
      excludeSemantics: true,
      onTap: onTap,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.outingSlotRadius),
        child: Ink(
          width: AppDimens.outingSlotWidth,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: highlight ? AppColors.braiseDouce : AppColors.blanc,
            borderRadius: BorderRadius.circular(AppDimens.outingSlotRadius),
            border: Border.all(
              color: selected ? AppColors.encre : AppColors.ligne,
              width: selected
                  ? AppDimens.borderWidthFocus
                  : AppDimens.borderWidth,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(day, style: AppTextStyles.slotDay),
              const SizedBox(height: AppDimens.outingSlotGap),
              Text(slot.label, style: AppTextStyles.meta),
              const SizedBox(height: AppDimens.outingSlotGap),
              Text(
                free,
                style: highlight
                    ? AppTextStyles.tag.copyWith(
                        fontSize: AppTextStyles.meta.fontSize,
                      )
                    : AppTextStyles.meta.copyWith(color: AppColors.encreDouce),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

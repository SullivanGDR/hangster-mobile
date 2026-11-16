import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/outing_draft.dart';
import '../proposal_labels.dart';

/// Rappel sobre du brouillon : groupe, créneau, critères.
class ProposalRecap extends StatelessWidget {
  const ProposalRecap({required this.draft, super.key});

  final OutingDraft draft;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final group = draft.group;
    final slot = draft.slot;
    final criteria = draft.criteria;
    final lines = [
      if (group != null && slot != null)
        l10n.proposalsRecapGroup(group.name, slot.label),
      l10n.proposalsRecapCriteria(
        ProposalLabels.budget(l10n, criteria.budget),
        criteria.maxTravelMinutes,
      ),
    ];
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.papier,
        borderRadius: BorderRadius.circular(AppDimens.radiusSmall),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.cardPaddingH,
            vertical: AppDimens.cardPaddingV,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final line in lines)
                Text(
                  line,
                  style: AppTextStyles.meta.copyWith(
                    color: AppColors.encreDouce,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/place_proposal.dart';
import '../proposal_labels.dart';

/// Carte de proposition à sélection unique : vignette, texte, radio.
class ProposalCard extends StatelessWidget {
  const ProposalCard({
    required this.proposal,
    required this.thumbColor,
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final PlaceProposal proposal;
  final Color thumbColor;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // La bordure sélectionnée (2) remplace celle de repos (1) sans décaler.
    final border = selected
        ? AppDimens.borderWidthFocus
        : AppDimens.borderWidth;
    final padding =
        AppDimens.proposalCardPadding + (selected ? 0 : AppDimens.borderWidth);
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: selected,
      button: true,
      label: l10n.proposalsChoose(proposal.name),
      onTap: onSelected,
      excludeSemantics: true,
      value: [
        ProposalLabels.meta(l10n, proposal),
        ProposalLabels.travel(l10n, proposal),
        l10n.proposalsLongest(proposal.longestTravelMinutes),
      ].join(', '),
      child: Material(
        color: AppColors.blanc,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusCard),
          side: BorderSide(
            color: selected ? AppColors.encre : AppColors.ligne,
            width: border,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onSelected,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: AppDimens.minTouchTarget,
            ),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Row(
                children: [
                  _Thumb(color: thumbColor),
                  const SizedBox(width: AppDimens.homeInnerGap),
                  Expanded(child: _Texts(proposal: proposal)),
                  const SizedBox(width: AppDimens.homeInnerGap),
                  _Radio(selected: selected),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(AppDimens.proposalThumbRadius),
    ),
    child: const SizedBox.square(dimension: AppDimens.proposalThumbSize),
  );
}

class _Texts extends StatelessWidget {
  const _Texts({required this.proposal});

  final PlaceProposal proposal;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(proposal.name, style: AppTextStyles.bodyStrong),
        Text(ProposalLabels.meta(l10n, proposal), style: AppTextStyles.meta),
        const SizedBox(height: AppDimens.spaceXs / 2),
        Text(
          ProposalLabels.travel(l10n, proposal),
          style: AppTextStyles.proposalTime,
        ),
        Text(
          l10n.proposalsLongest(proposal.longestTravelMinutes),
          style: AppTextStyles.meta,
        ),
      ],
    );
  }
}

class _Radio extends StatelessWidget {
  const _Radio({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: selected ? AppColors.encre : AppColors.gris,
        width: AppDimens.borderWidthFocus,
      ),
    ),
    child: SizedBox.square(
      dimension: AppDimens.proposalRadioSize,
      child: selected
          ? const Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.encre,
                ),
                child: SizedBox.square(
                  dimension: AppDimens.proposalRadioDotSize,
                ),
              ),
            )
          : null,
    ),
  );
}

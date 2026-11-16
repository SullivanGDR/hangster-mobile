import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/outing_idea.dart';

/// Section « Idées pour ce week-end » : cartes qui défilent horizontalement.
class IdeasSection extends StatelessWidget {
  const IdeasSection({required this.ideas, super.key});

  final List<OutingIdea> ideas;

  static const List<Color> _thumbs = [AppColors.ideeSable, AppColors.ideeSauge];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.homeSidePadding,
          ),
          child: Semantics(
            header: true,
            child: Text(l10n.homeIdeasTitle, style: AppTextStyles.sectionTitle),
          ),
        ),
        const SizedBox(height: AppDimens.homeCardGap),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.homeSidePadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < ideas.length; i++) ...[
                if (i > 0) const SizedBox(width: AppDimens.homeCardGap),
                _IdeaCard(idea: ideas[i], thumb: _thumbs[i % _thumbs.length]),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _IdeaCard extends StatelessWidget {
  const _IdeaCard({required this.idea, required this.thumb});

  final OutingIdea idea;
  final Color thumb;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SizedBox(
      width: AppDimens.ideaCardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExcludeSemantics(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: thumb,
                borderRadius: BorderRadius.circular(AppDimens.radiusCard),
              ),
              child: const SizedBox(
                width: AppDimens.ideaCardWidth,
                height: AppDimens.ideaThumbHeight,
              ),
            ),
          ),
          const SizedBox(height: AppDimens.ideaGap),
          Text(idea.title, style: AppTextStyles.bodyStrong),
          Text(
            l10n.homeIdeaMeta(
              idea.category,
              idea.priceEuros,
              idea.travelMinutes,
            ),
            style: AppTextStyles.meta,
          ),
        ],
      ),
    );
  }
}

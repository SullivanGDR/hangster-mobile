import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../l10n/generated/app_localizations.dart';

/// Avatars à initiales empilés, suivis d'un « +n » s'il reste des présents.
class AttendeeAvatars extends StatelessWidget {
  const AttendeeAvatars({required this.initials, this.extra = 0, super.key});

  final List<String> initials;
  final int extra;

  static const List<Color> _fills = [
    AppColors.blanc,
    AppColors.braise,
    AppColors.avatarBrume,
    AppColors.papier,
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final labels = [...initials, if (extra > 0) l10n.homeAttendeesMore(extra)];
    const step = AppDimens.homeAvatarSize - AppDimens.homeAvatarOverlap;
    return ExcludeSemantics(
      child: SizedBox(
        width: labels.isEmpty
            ? 0
            : AppDimens.homeAvatarSize + step * (labels.length - 1),
        height: AppDimens.homeAvatarSize,
        child: Stack(
          children: [
            for (var i = 0; i < labels.length; i++)
              Positioned(
                left: step * i,
                child: SizedBox.square(
                  dimension: AppDimens.homeAvatarSize,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _fills[i % _fills.length],
                      border: Border.all(
                        color: AppColors.encre,
                        width: AppDimens.homeAvatarBorder,
                      ),
                    ),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          labels[i],
                          style: AppTextStyles.avatarInitials,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

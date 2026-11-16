import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/free_friend.dart';
import 'home_card.dart';

/// Bandeau « n amis libres ce soir ».
class FreeFriendsBanner extends StatelessWidget {
  const FreeFriendsBanner({required this.friends, super.key});

  final List<FreeFriend> friends;

  String _names(AppLocalizations l10n) {
    final names = [for (final f in friends) f.firstName];
    if (names.length == 1) return names.first;
    return l10n.homeFreeNames(
      names.sublist(0, names.length - 1).join(', '),
      names.last,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return HomeCard(
      color: AppColors.braiseDouce,
      radius: AppDimens.radiusCard,
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.cardPaddingV,
        horizontal: AppDimens.cardPaddingH,
      ),
      onTap: () => context.go(AppRoutes.outings),
      child: Row(
        children: [
          const ExcludeSemantics(
            child: Icon(
              LucideIcons.zap,
              size: AppDimens.bannerIconSize,
              color: AppColors.braiseTexte,
            ),
          ),
          const SizedBox(width: AppDimens.homeCardGap),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.homeFreeBanner(friends.length),
                  style: AppTextStyles.bodyStrong,
                ),
                Text(
                  _names(l10n),
                  style: AppTextStyles.meta.copyWith(
                    color: AppColors.encreDouce,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppDimens.homeInnerGap),
          const ExcludeSemantics(
            child: Icon(
              LucideIcons.chevronRight,
              size: AppDimens.chevronSize,
              color: AppColors.encre,
            ),
          ),
        ],
      ),
    );
  }
}

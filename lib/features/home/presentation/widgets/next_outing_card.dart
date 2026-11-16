import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../core/clock/clock.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/next_outing.dart';
import '../countdown.dart';
import '../text_format.dart';
import 'attendee_avatars.dart';
import 'home_card.dart';

/// Carte sombre « Prochaine sortie » avec J-n et présents.
class NextOutingCard extends ConsumerWidget {
  const NextOutingCard({required this.outing, super.key});

  final NextOuting outing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final now = ref.watch(clockProvider)();
    final countdown = Countdown.between(now: now, target: outing.startsAt);
    final countdownLabel = switch (countdown.phase) {
      CountdownPhase.started => l10n.homeCountdownStarted,
      CountdownPhase.tonight => l10n.homeCountdownTonight,
      CountdownPhase.today => l10n.homeCountdownToday,
      CountdownPhase.tomorrow => l10n.homeCountdownTomorrow,
      CountdownPhase.later => l10n.homeCountdownDays(countdown.daysAway),
    };
    final countdownSemantics = countdown.phase == CountdownPhase.later
        ? l10n.homeCountdownSemantics(countdown.daysAway)
        : countdownLabel;
    return HomeCard(
      color: AppColors.encre,
      radius: AppDimens.radiusHero,
      padding: const EdgeInsets.all(AppDimens.heroPadding),
      onTap: () => context.go(AppRoutes.outings),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.homeNextOutingLabel(outing.groupName),
                      style: AppTextStyles.meta.copyWith(
                        color: AppColors.grisClair,
                      ),
                    ),
                    const SizedBox(height: AppDimens.heroTitleTop),
                    Text(outing.placeName, style: AppTextStyles.hero),
                    Text(
                      capitalize(
                        l10n.homeNextOutingWhen(
                          outing.startsAt,
                          outing.startsAt,
                        ),
                      ),
                      style: AppTextStyles.date.copyWith(
                        color: AppColors.brumeClaire,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppDimens.homeInnerGap),
              Semantics(
                label: countdownSemantics,
                excludeSemantics: true,
                child: Text(countdownLabel, style: AppTextStyles.strongNumber),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.homeInnerGap),
          Row(
            children: [
              AttendeeAvatars(
                initials: outing.attendeeInitials,
                extra: outing.confirmedCount - outing.attendeeInitials.length,
              ),
              const SizedBox(width: AppDimens.homeCardGap),
              Expanded(
                child: Text(
                  l10n.homeNextOutingConfirmed(
                    outing.confirmedCount,
                    outing.totalCount,
                  ),
                  textAlign: TextAlign.end,
                  style: AppTextStyles.meta.copyWith(
                    color: AppColors.brumeClaire,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

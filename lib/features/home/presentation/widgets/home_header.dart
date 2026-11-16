import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../core/clock/clock.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../auth/presentation/auth_providers.dart';
import '../text_format.dart';

/// Date, salutation avec le prénom de la session, et cloche.
class HomeHeader extends ConsumerWidget {
  const HomeHeader({this.unreadNotifications = 0, super.key});

  final int unreadNotifications;

  static const int _eveningHour = 18;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final now = ref.watch(clockProvider)();
    final evening = now.hour >= _eveningHour;
    final fullName = ref.watch(authControllerProvider).value?.user.displayName;
    final firstName = fullName?.trim().split(RegExp(r'\s+')).first ?? '';
    final String greeting;
    if (firstName.isEmpty) {
      greeting = evening
          ? l10n.homeGreetingEveningAnon
          : l10n.homeGreetingMorningAnon;
    } else {
      greeting = evening
          ? l10n.homeGreetingEvening(firstName)
          : l10n.homeGreetingMorning(firstName);
    }
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(capitalize(l10n.homeDate(now)), style: AppTextStyles.date),
              Semantics(
                header: true,
                child: Text(greeting, style: AppTextStyles.greeting),
              ),
            ],
          ),
        ),
        _BellButton(unread: unreadNotifications),
      ],
    );
  }
}

class _BellButton extends StatelessWidget {
  const _BellButton({required this.unread});

  final int unread;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final label = unread > 0
        ? l10n.homeNotificationsNew(unread)
        : l10n.homeNotifications;
    // Zone tactile de 48 dp autour du cercle visible de 44.
    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: InkResponse(
        // Pas encore de destination : l'écran notifications viendra avec l'API.
        onTap: () {},
        child: SizedBox.square(
          dimension: AppDimens.minTouchTarget,
          child: Center(
            child: SizedBox.square(
              dimension: AppDimens.bellSize,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.blanc,
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: AppColors.ligne,
                      width: AppDimens.borderWidth,
                    ),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      LucideIcons.bell,
                      size: AppDimens.bellIconSize,
                      color: AppColors.encre,
                    ),
                    if (unread > 0)
                      const Positioned(
                        top: AppDimens.bellDotTop,
                        right: AppDimens.bellDotRight,
                        child: SizedBox.square(
                          dimension: AppDimens.bellDotSize,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.braise,
                              border: Border.fromBorderSide(
                                BorderSide(
                                  color: AppColors.blanc,
                                  width: AppDimens.bellDotBorder,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

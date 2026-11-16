import 'package:flutter/painting.dart';

import 'app_colors.dart';

/// Styles typographiques. Bricolage Grotesque pour titres et chiffres forts,
/// Instrument Sans pour le reste.
abstract final class AppTextStyles {
  static const String displayFamily = 'BricolageGrotesque';
  static const String bodyFamily = 'InstrumentSans';

  static const double displaySize = 40;
  static const double headlineSize = 28;
  static const double titleSize = 20;
  static const double bodyLargeSize = 17;
  static const double bodySize = 15;
  static const double labelSize = 14;
  static const double captionSize = 12;

  static const TextStyle display = TextStyle(
    fontFamily: displayFamily,
    fontSize: displaySize,
    fontWeight: FontWeight.w700,
    height: 1.1,
    color: AppColors.encre,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: displayFamily,
    fontSize: headlineSize,
    fontWeight: FontWeight.w700,
    height: 1.15,
    color: AppColors.encre,
  );

  static const TextStyle title = TextStyle(
    fontFamily: displayFamily,
    fontSize: titleSize,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: AppColors.encre,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: bodyFamily,
    fontSize: bodyLargeSize,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.encre,
  );

  static const TextStyle body = TextStyle(
    fontFamily: bodyFamily,
    fontSize: bodySize,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.encre,
  );

  static const TextStyle label = TextStyle(
    fontFamily: bodyFamily,
    fontSize: labelSize,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: AppColors.encre,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: bodyFamily,
    fontSize: captionSize,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: AppColors.gris,
  );
}

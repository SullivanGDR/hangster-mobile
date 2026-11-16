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

  // Accueil (maquette mobile). Grade 650 via la police variable.
  static const FontVariation _w650 = FontVariation('wght', 650);

  static const TextStyle greeting = TextStyle(
    fontFamily: displayFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.28,
    height: 1.1,
    color: AppColors.encre,
  );

  static const TextStyle hero = TextStyle(
    fontFamily: displayFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.98,
    height: 1.1,
    color: AppColors.blanc,
  );

  static const TextStyle strongNumber = TextStyle(
    fontFamily: displayFamily,
    fontSize: 34,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.36,
    height: 1.2,
    color: AppColors.braise,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: bodyFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.45,
    color: AppColors.encre,
  );

  static const TextStyle bodyStrong = TextStyle(
    fontFamily: bodyFamily,
    fontSize: bodySize,
    fontWeight: FontWeight.w600,
    fontVariations: [_w650],
    height: 1.45,
    color: AppColors.encre,
  );

  static const TextStyle meta = TextStyle(
    fontFamily: bodyFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.45,
    color: AppColors.gris,
  );

  static const TextStyle date = TextStyle(
    fontFamily: bodyFamily,
    fontSize: labelSize,
    fontWeight: FontWeight.w400,
    height: 1.45,
    color: AppColors.gris,
  );

  static const TextStyle pill = TextStyle(
    fontFamily: bodyFamily,
    fontSize: labelSize,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: AppColors.blanc,
  );

  // Nouvelle sortie (maquette mobile).
  static const TextStyle outingHeading = TextStyle(
    fontFamily: displayFamily,
    fontSize: 34,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.36,
    height: 1.05,
    color: AppColors.encre,
  );

  static const TextStyle legend = TextStyle(
    fontFamily: bodyFamily,
    fontSize: bodySize,
    fontWeight: FontWeight.w600,
    fontVariations: [_w650],
    height: 1.3,
    color: AppColors.encre,
  );

  static const TextStyle wishInput = TextStyle(
    fontFamily: displayFamily,
    fontSize: 21,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.42,
    height: 1.3,
    color: AppColors.encre,
  );

  static const TextStyle wishHint = TextStyle(
    fontFamily: displayFamily,
    fontSize: 21,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.42,
    height: 1.3,
    color: AppColors.gris,
  );

  static const TextStyle tag = TextStyle(
    fontFamily: bodyFamily,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: AppColors.braiseTexte,
  );

  static const TextStyle slotDay = TextStyle(
    fontFamily: bodyFamily,
    fontSize: bodySize,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: AppColors.encre,
  );

  static const TextStyle avatarInitials = TextStyle(
    fontFamily: bodyFamily,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 1,
    color: AppColors.encre,
  );

  static const TextStyle navLabelActive = TextStyle(
    fontFamily: bodyFamily,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    fontVariations: [_w650],
    height: 1.45,
    color: AppColors.encre,
  );

  static const TextStyle navLabel = TextStyle(
    fontFamily: bodyFamily,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.45,
    color: AppColors.gris,
  );

  /// Titre d'écran de formulaire (maquettes étapes de sortie).
  static const TextStyle proposalsHeading = TextStyle(
    fontFamily: displayFamily,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.2,
    height: 1.1,
    color: AppColors.encre,
  );

  /// Durée de trajet d'une proposition.
  static const TextStyle proposalTime = TextStyle(
    fontFamily: bodyFamily,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.45,
    color: AppColors.encre,
  );
}

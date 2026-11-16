import 'package:flutter/painting.dart';

/// Palette Hangster. Seule source des couleurs de l'application.
abstract final class AppColors {
  /// Accent. Une seule action principale par écran.
  static const Color braise = Color(0xFFF2542D);

  /// Texte orange sur fond blanc (contraste AA).
  static const Color braiseTexte = Color(0xFFA5391F);

  static const Color braiseDouce = Color(0xFFFDEBE6);

  /// Texte et boutons forts.
  static const Color encre = Color(0xFF141210);

  static const Color encreDouce = Color(0xFF4A4641);
  static const Color gris = Color(0xFF6B6660);
  static const Color ligne = Color(0xFFECEAE6);

  /// Fond d'écran.
  static const Color papier = Color(0xFFF6F4F0);

  static const Color blanc = Color(0xFFFFFFFF);

  /// Séparateur de la barre du bas.
  static const Color ligneNav = Color(0xFFF0EEEA);

  /// Libellé sur fond sombre.
  static const Color grisClair = Color(0xFFB5B0A9);

  /// Texte secondaire sur fond sombre.
  static const Color brumeClaire = Color(0xFFD6D2CC);

  static const Color avatarBrume = Color(0xFFD9D4CC);
  static const Color ideeSable = Color(0xFFEDE6DD);
  static const Color ideeSauge = Color(0xFFE3E9E4);
  static const Color ideeLavande = Color(0xFFE8E5EE);
}

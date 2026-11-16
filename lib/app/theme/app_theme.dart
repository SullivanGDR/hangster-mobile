import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';
import 'app_dimens.dart';
import 'app_text_styles.dart';

/// Thème Material 3, mode clair uniquement.
abstract final class AppTheme {
  static ThemeData light() {
    const scheme = ColorScheme.light(
      primary: AppColors.braise,
      onPrimary: AppColors.encre,
      primaryContainer: AppColors.braiseDouce,
      onPrimaryContainer: AppColors.braiseTexte,
      secondary: AppColors.encre,
      onSecondary: AppColors.blanc,
      surface: AppColors.papier,
      onSurface: AppColors.encre,
      onSurfaceVariant: AppColors.encreDouce,
      outline: AppColors.gris,
      outlineVariant: AppColors.ligne,
      error: AppColors.braiseTexte,
      onError: AppColors.blanc,
    );

    const textTheme = TextTheme(
      displayLarge: AppTextStyles.display,
      displayMedium: AppTextStyles.display,
      displaySmall: AppTextStyles.headline,
      headlineLarge: AppTextStyles.headline,
      headlineMedium: AppTextStyles.headline,
      headlineSmall: AppTextStyles.title,
      titleLarge: AppTextStyles.title,
      titleMedium: AppTextStyles.bodyLarge,
      titleSmall: AppTextStyles.label,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.caption,
      labelLarge: AppTextStyles.label,
      labelMedium: AppTextStyles.label,
      labelSmall: AppTextStyles.caption,
    );

    const pill = StadiumBorder();
    const minSize = Size(AppDimens.minTouchTarget, AppDimens.minTouchTarget);
    const buttonPadding = EdgeInsets.symmetric(horizontal: AppDimens.spaceL);
    const lineSide = BorderSide(
      color: AppColors.ligne,
      width: AppDimens.borderWidth,
    );
    final fieldRadius = BorderRadius.circular(AppDimens.radiusSmall);
    OutlineInputBorder fieldBorder(Color color, double width) =>
        OutlineInputBorder(
          borderRadius: fieldRadius,
          borderSide: BorderSide(color: color, width: width),
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.papier,
      textTheme: textTheme,
      fontFamily: AppTextStyles.bodyFamily,
      splashFactory: NoSplash.splashFactory,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.papier,
        foregroundColor: AppColors.encre,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppTextStyles.title,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.braise,
          foregroundColor: AppColors.encre,
          minimumSize: minSize,
          padding: buttonPadding,
          shape: pill,
          elevation: 0,
          textStyle: AppTextStyles.label,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.encre,
          foregroundColor: AppColors.blanc,
          minimumSize: minSize,
          padding: buttonPadding,
          shape: pill,
          elevation: 0,
          textStyle: AppTextStyles.label,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.encre,
          minimumSize: minSize,
          padding: buttonPadding,
          shape: pill,
          side: lineSide,
          textStyle: AppTextStyles.label,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.braiseTexte,
          minimumSize: minSize,
          shape: pill,
          textStyle: AppTextStyles.label,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.blanc,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
          side: lineSide,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.blanc,
        contentPadding: const EdgeInsets.all(AppDimens.spaceM),
        hintStyle: AppTextStyles.body.copyWith(color: AppColors.gris),
        border: fieldBorder(AppColors.ligne, AppDimens.borderWidth),
        enabledBorder: fieldBorder(AppColors.ligne, AppDimens.borderWidth),
        focusedBorder: fieldBorder(AppColors.encre, AppDimens.borderWidthFocus),
        errorBorder: fieldBorder(AppColors.braiseTexte, AppDimens.borderWidth),
        focusedErrorBorder: fieldBorder(
          AppColors.braiseTexte,
          AppDimens.borderWidthFocus,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.ligne,
        thickness: AppDimens.borderWidth,
        space: AppDimens.borderWidth,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.blanc,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.blanc,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimens.radiusLarge),
          ),
        ),
      ),
    );
  }
}

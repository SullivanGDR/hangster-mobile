import 'package:material_ui/material_ui.dart';
import 'package:hangster_mobile/app/theme/app_colors.dart';

enum AppButtonVariant { primary, strong, secondary }

/// Pill button: flat fill, no shadow, no gradient, 48 dp minimum height.
class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    super.key,
  });

  static const double minHeight = 48;
  static const double _horizontalPadding = 24;
  static const double _borderWidth = 1.5;

  final String label;

  /// Null disables the button.
  final VoidCallback? onPressed;
  final AppButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color fg, BorderSide side) = switch (variant) {
      AppButtonVariant.primary => (
        AppColors.braise,
        AppColors.encre,
        BorderSide.none,
      ),
      AppButtonVariant.strong => (
        AppColors.encre,
        AppColors.blanc,
        BorderSide.none,
      ),
      AppButtonVariant.secondary => (
        AppColors.blanc,
        AppColors.encre,
        const BorderSide(color: AppColors.ligne, width: _borderWidth),
      ),
    };
    final style = ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(minHeight, minHeight)),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: _horizontalPadding),
      ),
      elevation: const WidgetStatePropertyAll(0),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
      shape: WidgetStatePropertyAll(StadiumBorder(side: side)),
      backgroundColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.disabled) ? AppColors.ligne : bg,
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.disabled) ? AppColors.gris : fg,
      ),
    );
    return FilledButton(
      onPressed: onPressed,
      style: style,
      child: Text(label, textAlign: TextAlign.center),
    );
  }
}

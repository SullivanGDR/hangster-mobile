import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_dimens.dart';

/// Aplat à coins arrondis, sans ombre, cliquable sur toute sa surface.
class HomeCard extends StatelessWidget {
  const HomeCard({
    required this.child,
    required this.radius,
    required this.padding,
    this.color,
    this.outlined = false,
    this.onTap,
    super.key,
  });

  final Widget child;
  final double radius;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final bool outlined;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Padding(padding: padding, child: child);
    return Material(
      color: color ?? AppColors.blanc,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: outlined
            ? const BorderSide(
                color: AppColors.ligne,
                width: AppDimens.borderWidth,
              )
            : BorderSide.none,
      ),
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? content
          : Semantics(
              button: true,
              child: InkWell(onTap: onTap, child: content),
            ),
    );
  }
}

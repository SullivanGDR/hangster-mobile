import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Available logo variants, each mapped to a file in `assets/brand/`.
enum HangsterLogoVariant {
  horizontalColor('assets/brand/hangster-horizontal-couleur.svg'),
  horizontalWhite('assets/brand/hangster-horizontal-blanc.svg'),
  horizontalOnOrange('assets/brand/hangster-horizontal-sur-orange.svg'),
  symbol('assets/brand/hangster-symbole-couleur.svg');

  const HangsterLogoVariant(this.assetPath);

  final String assetPath;
}

/// Hangster logo rendered from the provided brand SVG files.
class HangsterLogo extends StatelessWidget {
  const HangsterLogo({
    required this.semanticLabel,
    this.variant = HangsterLogoVariant.horizontalColor,
    this.width,
    this.height,
    super.key,
  });

  final HangsterLogoVariant variant;
  final String semanticLabel;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      variant.assetPath,
      width: width,
      height: height,
      semanticsLabel: semanticLabel,
    );
  }
}

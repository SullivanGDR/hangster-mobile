import 'package:material_ui/material_ui.dart';
import 'package:hangster_mobile/app/theme/app_colors.dart';

/// Rising and setting sun behind three horizon bars. Static when the system
/// asks to reduce animations.
class SunLoader extends StatefulWidget {
  const SunLoader({required this.semanticLabel, this.width = 112, super.key});

  final String semanticLabel;
  final double width;

  @override
  State<SunLoader> createState() => _SunLoaderState();
}

class _SunLoaderState extends State<SunLoader>
    with SingleTickerProviderStateMixin {
  static const Duration _cycle = Duration(milliseconds: 2600);

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _cycle,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.stop();
    } else if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.disableAnimationsOf(context);
    return Semantics(
      label: widget.semanticLabel,
      container: true,
      child: ExcludeSemantics(
        child: SizedBox(
          width: widget.width,
          height: widget.width * SunPainter.height / SunPainter.width,
          child: CustomPaint(
            painter: SunPainter(progress: _controller, fixed: reduce),
          ),
        ),
      ),
    );
  }
}

/// Paints the loader in the SVG viewBox coordinates (56 x 52).
class SunPainter extends CustomPainter {
  SunPainter({required this.progress, required this.fixed})
    : super(repaint: progress);

  static const double width = 56;
  static const double height = 52;
  static const double _originX = 4;
  static const double _originY = 14.5;
  static const double _sunRadius = 19;
  static const double _sunCenterX = 32;
  static const double _sunBaseY = 38;
  static const double _sunTravel = 22;
  static const double _skyBottom = 39;
  static const double _skyWidth = 64;

  final Animation<double> progress;
  final bool fixed;

  /// 0 = fully up, 1 = fully hidden. Mirrors the SVG keyframes.
  double _hidden() {
    if (fixed) return 0;
    final p = (progress.value + 0.5) % 1.0;
    if (p < 0.45) {
      return Curves.easeInOut.transform(1 - p / 0.45);
    }
    if (p <= 0.55) return 0;
    return Curves.easeInOut.transform((p - 0.55) / 0.45);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / width;
    canvas
      ..save()
      ..scale(scale)
      ..translate(-_originX, -_originY)
      ..save()
      ..clipRect(const Rect.fromLTWH(0, 0, _skyWidth, _skyBottom));

    final dy = _hidden() * _sunTravel;
    final sun = Path()
      ..moveTo(_sunCenterX - _sunRadius, _sunBaseY + dy)
      ..arcToPoint(
        Offset(_sunCenterX + _sunRadius, _sunBaseY + dy),
        radius: const Radius.circular(_sunRadius),
      )
      ..close();
    canvas
      ..drawPath(sun, Paint()..color = AppColors.braise)
      ..restore();

    final ink = Paint()..color = AppColors.encre;
    for (final bar in const [
      Rect.fromLTWH(6, 41, 52, 5.5),
      Rect.fromLTWH(16, 50, 32, 4.5),
      Rect.fromLTWH(25, 58, 14, 4),
    ]) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(bar, Radius.circular(bar.height / 2)),
        ink,
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(SunPainter old) => old.fixed != fixed;
}

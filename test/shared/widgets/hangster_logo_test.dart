import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/shared/widgets/hangster_logo.dart';

void main() {
  testWidgets('renders each variant from its brand asset', (tester) async {
    for (final v in HangsterLogoVariant.values) {
      await tester.pumpWidget(
        MaterialApp(
          home: HangsterLogo(semanticLabel: 'Hangster', variant: v, width: 120),
        ),
      );
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(v.assetPath, startsWith('assets/brand/'));
    }
  });
}

import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/shared/widgets/sun_loader.dart';

Widget _wrap({required bool disableAnimations}) => MaterialApp(
  home: MediaQuery(
    data: MediaQueryData(disableAnimations: disableAnimations),
    child: const Scaffold(body: SunLoader(semanticLabel: 'Chargement')),
  ),
);

void main() {
  testWidgets('animates by default and exposes semantics', (tester) async {
    await tester.pumpWidget(_wrap(disableAnimations: false));
    expect(find.bySemanticsLabel('Chargement'), findsOneWidget);
    expect(tester.hasRunningAnimations, isTrue);
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('is static when animations are disabled', (tester) async {
    await tester.pumpWidget(_wrap(disableAnimations: true));
    expect(tester.hasRunningAnimations, isFalse);
    await tester.pumpAndSettle();
    expect(find.bySemanticsLabel('Chargement'), findsOneWidget);
  });
}

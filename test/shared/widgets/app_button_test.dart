import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/shared/widgets/app_button.dart';

Widget _wrap(Widget child) => MaterialApp(
  home: Scaffold(body: Center(child: child)),
);

void main() {
  testWidgets('renders label and handles tap', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _wrap(AppButton(label: 'Valider', onPressed: () => taps++)),
    );
    expect(find.text('Valider'), findsOneWidget);
    expect(
      tester.getSize(find.byType(FilledButton)).height,
      greaterThanOrEqualTo(48),
    );
    await tester.tap(find.byType(AppButton));
    expect(taps, 1);
  });

  testWidgets('disabled button ignores taps', (tester) async {
    await tester.pumpWidget(
      _wrap(const AppButton(label: 'Valider', onPressed: null)),
    );
    final button = tester.widget<FilledButton>(find.byType(FilledButton));
    expect(button.onPressed, isNull);
  });

  testWidgets('renders every variant', (tester) async {
    for (final v in AppButtonVariant.values) {
      await tester.pumpWidget(
        _wrap(AppButton(label: 'A', onPressed: () {}, variant: v)),
      );
      expect(find.text('A'), findsOneWidget);
    }
  });
}

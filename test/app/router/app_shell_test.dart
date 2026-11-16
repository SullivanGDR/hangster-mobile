import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/app/app.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

import '../../support/signed_in.dart';

Future<void> _pump(WidgetTester tester) async {
  await tester.pumpWidget(
    ProviderScope(overrides: signedInOverrides(), child: const HangsterApp()),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('affiche les 5 entrees', (tester) async {
    await _pump(tester);
    for (final label in ['Accueil', 'Sorties', 'Groupes', 'Profil']) {
      expect(find.text(label), findsWidgets);
    }
    expect(find.bySemanticsLabel('Nouvelle sortie'), findsOneWidget);
  });

  testWidgets('la barre est collee en bas de l\'ecran', (tester) async {
    await _pump(tester);
    final screenHeight =
        tester.view.physicalSize.height / tester.view.devicePixelRatio;
    final plus = tester.getRect(find.bySemanticsLabel('Nouvelle sortie'));
    final groupes = tester.getRect(find.text('Groupes'));
    expect(plus.bottom, greaterThan(screenHeight - 100));
    expect(groupes.bottom, greaterThan(screenHeight - 100));
  });

  testWidgets('tap sur Groupes change d\'ecran', (tester) async {
    await _pump(tester);
    expect(find.text('Groupes'), findsOneWidget);
    await tester.tap(find.text('Groupes'));
    await tester.pumpAndSettle();
    expect(find.text('Groupes'), findsNWidgets(2));
  });

  testWidgets('tap sur + ouvre la nouvelle sortie', (tester) async {
    await _pump(tester);
    await tester.tap(find.byIcon(LucideIcons.plus));
    await tester.pumpAndSettle();
    expect(find.text('Nouvelle sortie'), findsOneWidget);
    expect(find.text('Sorties'), findsNothing);
  });

  testWidgets('cibles tactiles >= 48 dp', (tester) async {
    await _pump(tester);
    for (final finder in [
      find.ancestor(
        of: find.text('Accueil'),
        matching: find.byType(InkResponse),
      ),
      find.ancestor(
        of: find.text('Profil'),
        matching: find.byType(InkResponse),
      ),
      find.ancestor(
        of: find.byIcon(LucideIcons.plus),
        matching: find.byType(InkWell),
      ),
    ]) {
      final size = tester.getSize(finder.first);
      expect(size.width, greaterThanOrEqualTo(48));
      expect(size.height, greaterThanOrEqualTo(48));
    }
  });
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/app/app.dart';
import 'package:material_ui/material_ui.dart';

import 'support/signed_in.dart';

void main() {
  testWidgets('HangsterApp demarre sur l\'accueil', (tester) async {
    await tester.pumpWidget(
      ProviderScope(overrides: signedInOverrides(), child: const HangsterApp()),
    );
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Accueil'), findsWidgets);
  });
}

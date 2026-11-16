import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/core/errors/api_failure.dart';
import 'package:hangster_mobile/features/auth/data/fake_auth_repository.dart';
import 'package:hangster_mobile/features/auth/presentation/auth_providers.dart';

void main() {
  ProviderContainer container() {
    final c = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(
          FakeAuthRepository(latency: Duration.zero),
        ),
      ],
    );
    addTearDown(c.dispose);
    return c;
  }

  test('demarre deconnecte, signIn puis signOut', () async {
    final c = container();
    expect(await c.read(authControllerProvider.future), isNull);
    await c
        .read(authControllerProvider.notifier)
        .signIn(email: 'camille@example.com', password: 'motdepasse123');
    expect(c.read(authControllerProvider).value?.user.displayName, 'Camille');
    await c.read(authControllerProvider.notifier).signOut();
    expect(c.read(authControllerProvider).value, isNull);
  });

  test('echec de connexion laisse etat inchange', () async {
    final c = container();
    await c.read(authControllerProvider.future);
    await expectLater(
      c
          .read(authControllerProvider.notifier)
          .signIn(email: 'camille@example.com', password: 'faux'),
      throwsA(isA<ApiUnauthorized>()),
    );
    expect(c.read(authControllerProvider).value, isNull);
  });
}

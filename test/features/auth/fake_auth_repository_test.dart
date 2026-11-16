import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/core/errors/api_failure.dart';
import 'package:hangster_mobile/features/auth/data/fake_auth_repository.dart';
import 'package:hangster_mobile/features/auth/domain/sign_up_data.dart';

void main() {
  FakeAuthRepository repo() => FakeAuthRepository(latency: Duration.zero);

  test('signIn reussit, insensible a la casse', () async {
    final r = repo();
    final s = await r.signIn(
      email: ' Camille@Example.com ',
      password: 'motdepasse123',
    );
    expect(s.user.displayName, 'Camille');
    expect(await r.currentSession(), s);
  });

  test('mauvais mot de passe -> ApiUnauthorized', () {
    expect(
      repo().signIn(email: 'camille@example.com', password: 'x'),
      throwsA(isA<ApiUnauthorized>()),
    );
  });

  test('signUp reussit puis e-mail pris -> ApiValidation', () async {
    final r = repo();
    const data = SignUpData(
      email: 'Lea@Example.com',
      password: 'secret123',
      displayName: 'Lea',
    );
    final s = await r.signUp(data);
    expect(s.user.email, 'lea@example.com');
    expect(r.signUp(data), throwsA(isA<ApiValidation>()));
  });

  test('signOut efface la session', () async {
    final r = repo();
    await r.signIn(email: 'camille@example.com', password: 'motdepasse123');
    await r.signOut();
    expect(await r.currentSession(), isNull);
  });
}

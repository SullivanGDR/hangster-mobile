import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../invitation/data/fake_invitation_repository.dart';
import '../../invitation/domain/invitation_repository.dart';
import '../../onboarding/data/fake_preferences_repository.dart';
import '../../onboarding/domain/preferences_repository.dart';
import '../data/fake_auth_repository.dart';
import '../domain/auth_repository.dart';
import '../domain/session.dart';
import '../domain/sign_up_data.dart';

part 'auth_providers.g.dart';

// Fakes branches ici tant que l'API n'existe pas.
@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => FakeAuthRepository();

@Riverpod(keepAlive: true)
PreferencesRepository preferencesRepository(Ref ref) =>
    FakePreferencesRepository();

@Riverpod(keepAlive: true)
InvitationRepository invitationRepository(Ref ref) =>
    FakeInvitationRepository();

/// Session courante (null si deconnecte).
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  Future<Session?> build() => ref.read(authRepositoryProvider).currentSession();

  Future<void> signIn({required String email, required String password}) async {
    final session = await ref
        .read(authRepositoryProvider)
        .signIn(email: email, password: password);
    state = AsyncData(session);
  }

  Future<void> signUp(SignUpData data) async {
    final session = await ref.read(authRepositoryProvider).signUp(data);
    state = AsyncData(session);
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
    state = const AsyncData(null);
  }
}

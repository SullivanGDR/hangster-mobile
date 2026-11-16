import 'session.dart';
import 'sign_up_data.dart';

/// Acces aux comptes. Les erreurs sont des `ApiFailure`.
abstract interface class AuthRepository {
  Future<Session> signUp(SignUpData data);
  Future<Session> signIn({required String email, required String password});
  Future<void> signOut();
  Future<Session?> currentSession();
}

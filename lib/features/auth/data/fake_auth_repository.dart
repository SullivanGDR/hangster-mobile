import '../../../core/errors/api_failure.dart';
import '../domain/auth_repository.dart';
import '../domain/auth_user.dart';
import '../domain/session.dart';
import '../domain/sign_up_data.dart';

/// Implementation en memoire, sans HTTP ni jeton persiste.
class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({
    Session? initialSession,
    this.latency = const Duration(milliseconds: 400),
  }) : _session = initialSession {
    _accounts['camille@example.com'] = (
      password: 'motdepasse123',
      user: const AuthUser(
        id: 'u1',
        email: 'camille@example.com',
        displayName: 'Camille',
      ),
    );
  }

  final Duration latency;
  final Map<String, ({String password, AuthUser user})> _accounts = {};
  Session? _session;

  String _key(String email) => email.trim().toLowerCase();

  @override
  Future<Session> signUp(SignUpData data) async {
    await Future<void>.delayed(latency);
    final key = _key(data.email);
    if (_accounts.containsKey(key)) {
      throw const ApiValidation(
        title: 'Email already used',
        errors: {
          'email': ['already_used'],
        },
      );
    }
    final user = AuthUser(
      id: 'u${_accounts.length + 1}',
      email: key,
      displayName: data.displayName.trim(),
    );
    _accounts[key] = (password: data.password, user: user);
    return _session = Session(user: user);
  }

  @override
  Future<Session> signIn({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(latency);
    final account = _accounts[_key(email)];
    if (account == null || account.password != password) {
      throw const ApiUnauthorized(title: 'Invalid credentials');
    }
    return _session = Session(user: account.user);
  }

  @override
  Future<void> signOut() async {
    await Future<void>.delayed(latency);
    _session = null;
  }

  @override
  Future<Session?> currentSession() async => _session;
}

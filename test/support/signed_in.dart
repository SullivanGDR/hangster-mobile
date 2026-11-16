import 'package:flutter_riverpod/misc.dart';
import 'package:hangster_mobile/features/auth/data/fake_auth_repository.dart';
import 'package:hangster_mobile/features/auth/domain/auth_user.dart';
import 'package:hangster_mobile/features/auth/domain/session.dart';
import 'package:hangster_mobile/features/auth/presentation/auth_providers.dart';

/// Overrides pour demarrer avec une session connectee.
List<Override> signedInOverrides() => [
  authRepositoryProvider.overrideWithValue(
    FakeAuthRepository(
      initialSession: const Session(
        user: AuthUser(
          id: 'u1',
          email: 'camille@example.com',
          displayName: 'Camille',
        ),
      ),
      latency: Duration.zero,
    ),
  ),
];

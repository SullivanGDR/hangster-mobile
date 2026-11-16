import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/fake_home_repository.dart';
import '../domain/home_overview.dart';
import '../domain/home_repository.dart';

part 'home_providers.g.dart';

// Fake branché ici tant que l'API n'existe pas.
@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) => FakeHomeRepository();

Duration? _noRetry(int retryCount, Object error) => null;

/// Contenu de l'accueil, sans nouvelle tentative automatique.
@Riverpod(retry: _noRetry)
Future<HomeOverview> homeOverview(Ref ref) =>
    ref.read(homeRepositoryProvider).overview();

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clock.g.dart';

/// Source de l'heure courante, remplaçable dans les tests.
typedef Clock = DateTime Function();

@Riverpod(keepAlive: true)
Clock clock(Ref ref) => DateTime.now;

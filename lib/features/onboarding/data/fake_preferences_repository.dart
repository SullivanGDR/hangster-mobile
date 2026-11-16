import '../domain/preferences_repository.dart';
import '../domain/taste_preferences.dart';

class FakePreferencesRepository implements PreferencesRepository {
  FakePreferencesRepository({
    TastePreferences initial = const TastePreferences(),
    this.latency = const Duration(milliseconds: 400),
  }) : _current = initial;

  final Duration latency;
  TastePreferences _current;

  @override
  Future<TastePreferences> load() async {
    await Future<void>.delayed(latency);
    return _current;
  }

  @override
  Future<void> save(TastePreferences preferences) async {
    await Future<void>.delayed(latency);
    _current = preferences;
  }
}

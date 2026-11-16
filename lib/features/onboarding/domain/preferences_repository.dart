import 'taste_preferences.dart';

abstract interface class PreferencesRepository {
  Future<TastePreferences> load();
  Future<void> save(TastePreferences preferences);
}

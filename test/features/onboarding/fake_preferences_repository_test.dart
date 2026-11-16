import 'package:flutter_test/flutter_test.dart';
import 'package:hangster_mobile/features/onboarding/data/fake_preferences_repository.dart';
import 'package:hangster_mobile/features/onboarding/domain/taste_preferences.dart';

void main() {
  test('save puis load', () async {
    final r = FakePreferencesRepository(latency: Duration.zero);
    expect((await r.load()).categories, isEmpty);
    final prefs = TastePreferences(
      categories: {OutingCategory.bars, OutingCategory.karaoke},
      budget: BudgetRange.from15to30,
      zone: AreaZone.approximate(
        label: 'Lyon 7e',
        latitude: 45.7512,
        longitude: 4.8423,
      ),
    );
    await r.save(prefs);
    expect(await r.load(), prefs);
  });

  test('la zone est arrondie a ~500 m', () {
    final z = AreaZone.approximate(
      label: 'x',
      latitude: 45.7512,
      longitude: 4.8423,
    );
    expect(z.latitude, closeTo(45.75, 0.0001));
    expect(z.longitude, closeTo(4.84, 0.0001));
  });
}

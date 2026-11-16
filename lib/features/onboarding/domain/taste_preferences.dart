import 'package:freezed_annotation/freezed_annotation.dart';

part 'taste_preferences.freezed.dart';

enum OutingCategory { bars, restaurants, games, karaoke, outdoors, concerts }

enum BudgetRange { under15, from15to30, from30to50, over50 }

/// Zone approximative (~500 m) : jamais l'adresse exacte.
@freezed
abstract class AreaZone with _$AreaZone {
  const factory AreaZone({
    required String label,
    required double latitude,
    required double longitude,
  }) = _AreaZone;

  /// Arrondit les coordonnees a ~500 m (0,005 degre).
  factory AreaZone.approximate({
    required String label,
    required double latitude,
    required double longitude,
  }) => AreaZone(
    label: label,
    latitude: _round(latitude),
    longitude: _round(longitude),
  );

  static double _round(double v) => (v / 0.005).round() * 0.005;
}

@freezed
abstract class TastePreferences with _$TastePreferences {
  const factory TastePreferences({
    @Default(<OutingCategory>{}) Set<OutingCategory> categories,
    BudgetRange? budget,
    AreaZone? zone,
  }) = _TastePreferences;
}

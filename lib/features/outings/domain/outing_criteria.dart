import 'package:freezed_annotation/freezed_annotation.dart';

import '../../onboarding/domain/taste_preferences.dart';

part 'outing_criteria.freezed.dart';

/// Critères de recherche : budget et trajet maximal.
@freezed
abstract class OutingCriteria with _$OutingCriteria {
  const factory OutingCriteria({
    @Default(BudgetRange.from15to30) BudgetRange budget,
    @Default(30) int maxTravelMinutes,
  }) = _OutingCriteria;
}

extension BudgetRangeLimit on BudgetRange {
  /// Prix maximal en euros, `null` si aucune limite.
  int? get maxEuros => switch (this) {
    BudgetRange.under15 => 15,
    BudgetRange.from15to30 => 30,
    BudgetRange.from30to50 => 50,
    BudgetRange.over50 => null,
  };
}

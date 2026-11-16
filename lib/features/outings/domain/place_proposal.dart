import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../onboarding/domain/taste_preferences.dart';

part 'place_proposal.freezed.dart';

/// Lieu proposé au groupe.
@freezed
abstract class PlaceProposal with _$PlaceProposal {
  const PlaceProposal._();

  const factory PlaceProposal({
    required String id,
    required String name,
    required OutingCategory category,
    required int priceEuros,
    required int durationMinutes,
    required int minTravelMinutes,
    required int maxTravelMinutes,
  }) = _PlaceProposal;

  /// Trajet le plus long parmi les membres : critère de classement.
  int get longestTravelMinutes => math.max(minTravelMinutes, maxTravelMinutes);
}

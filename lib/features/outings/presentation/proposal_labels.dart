import '../../../l10n/generated/app_localizations.dart';
import '../../onboarding/domain/taste_preferences.dart';
import '../domain/place_proposal.dart';

/// Libellés affichables des données d'une proposition.
abstract final class ProposalLabels {
  static const int _minutesPerHour = 60;

  static String category(AppLocalizations l10n, OutingCategory c) =>
      switch (c) {
        OutingCategory.bars => l10n.onboardingCategoryBars,
        OutingCategory.restaurants => l10n.onboardingCategoryRestaurants,
        OutingCategory.games => l10n.onboardingCategoryGames,
        OutingCategory.karaoke => l10n.onboardingCategoryKaraoke,
        OutingCategory.outdoors => l10n.onboardingCategoryOutdoors,
        OutingCategory.concerts => l10n.onboardingCategoryConcerts,
      };

  static String budget(AppLocalizations l10n, BudgetRange b) => switch (b) {
    BudgetRange.under15 => l10n.onboardingBudgetUnder15,
    BudgetRange.from15to30 => l10n.onboardingBudgetFrom15to30,
    BudgetRange.from30to50 => l10n.onboardingBudgetFrom30to50,
    BudgetRange.over50 => l10n.onboardingBudgetOver50,
  };

  static String duration(AppLocalizations l10n, int minutes) {
    final hours = minutes ~/ _minutesPerHour;
    final rest = minutes % _minutesPerHour;
    if (hours == 0) return l10n.proposalsDurationMinutes(minutes);
    if (rest == 0) return l10n.proposalsDurationHours(hours);
    return l10n.proposalsDurationHoursMinutes(
      hours,
      rest.toString().padLeft(2, '0'),
    );
  }

  static String meta(AppLocalizations l10n, PlaceProposal p) =>
      l10n.proposalsMeta(
        category(l10n, p.category),
        p.priceEuros,
        duration(l10n, p.durationMinutes),
      );

  static String travel(AppLocalizations l10n, PlaceProposal p) =>
      p.minTravelMinutes == p.maxTravelMinutes
      ? l10n.proposalsTravelSame(p.maxTravelMinutes)
      : l10n.proposalsTravelRange(p.minTravelMinutes, p.maxTravelMinutes);
}

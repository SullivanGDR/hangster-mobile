import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../app/router/app_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_dimens.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../shared/widgets/app_button.dart';
import '../../auth/presentation/auth_providers.dart';
import '../domain/taste_preferences.dart';

const int _stepCount = 3;

/// Écran d'onboarding des goûts : envies, budget, zone approximative.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({this.from, super.key});

  /// Destination après l'onboarding. À défaut, le paramètre de requête `from`.
  final String? from;

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  static const double _maxContentWidth = 560;

  int _step = 0;
  final Set<OutingCategory> _categories = {};
  BudgetRange? _budget;
  AreaZone? _zone;
  bool _saving = false;
  bool _saveFailed = false;

  bool get _canContinue => switch (_step) {
    0 => _categories.isNotEmpty,
    1 => _budget != null,
    _ => _zone != null,
  };

  String _destination() {
    final from =
        widget.from ??
        GoRouter.maybeOf(context)?.state.uri.queryParameters['from'];
    final valid =
        from != null && from.startsWith('/') && !from.startsWith('//');
    return valid ? from : AppRoutes.home;
  }

  Future<void> _finish({required bool skipZone}) async {
    setState(() {
      _saving = true;
      _saveFailed = false;
    });
    final destination = _destination();
    try {
      await ref
          .read(preferencesRepositoryProvider)
          .save(
            TastePreferences(
              categories: Set.of(_categories),
              budget: _budget,
              zone: skipZone ? null : _zone,
            ),
          );
      if (mounted) context.go(destination);
    } on Exception {
      if (mounted) {
        setState(() {
          _saving = false;
          _saveFailed = true;
        });
      }
    }
  }

  void _next() {
    if (_step < _stepCount - 1) {
      setState(() => _step++);
    } else {
      _finish(skipZone: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isLast = _step == _stepCount - 1;
    final (title, hint) = switch (_step) {
      0 => (l10n.onboardingCategoriesTitle, l10n.onboardingCategoriesHint),
      1 => (l10n.onboardingBudgetTitle, l10n.onboardingBudgetHint),
      _ => (l10n.onboardingZoneTitle, l10n.onboardingZoneHint),
    };

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxContentWidth),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppDimens.spaceL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Progress(step: _step + 1),
                  const SizedBox(height: AppDimens.spaceL),
                  Text(title, style: AppTextStyles.headline),
                  const SizedBox(height: AppDimens.spaceS),
                  Text(
                    hint,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.encreDouce,
                    ),
                  ),
                  const SizedBox(height: AppDimens.spaceL),
                  switch (_step) {
                    0 => _CategoryChoices(
                      selected: _categories,
                      onToggle: (c) => setState(() {
                        if (!_categories.remove(c)) _categories.add(c);
                      }),
                    ),
                    1 => _BudgetChoices(
                      selected: _budget,
                      onSelect: (b) => setState(() => _budget = b),
                    ),
                    _ => _ZoneChoices(
                      selected: _zone,
                      onSelect: (z) => setState(() => _zone = z),
                    ),
                  },
                  const SizedBox(height: AppDimens.spaceXl),
                  if (_saveFailed) ...[
                    Text(
                      l10n.onboardingSaveError,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.braiseTexte,
                      ),
                    ),
                    const SizedBox(height: AppDimens.spaceM),
                  ],
                  AppButton(
                    label: isLast
                        ? l10n.onboardingFinish
                        : l10n.onboardingContinue,
                    onPressed: _canContinue && !_saving ? _next : null,
                  ),
                  const SizedBox(height: AppDimens.spaceS),
                  if (_step > 0)
                    AppButton(
                      label: l10n.onboardingBack,
                      variant: AppButtonVariant.secondary,
                      onPressed: _saving ? null : () => setState(() => _step--),
                    ),
                  if (isLast)
                    TextButton(
                      onPressed: _saving ? null : () => _finish(skipZone: true),
                      child: Text(l10n.onboardingSkip),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Progress extends StatelessWidget {
  const _Progress({required this.step});

  static const double _barHeight = 8;

  final int step;

  @override
  Widget build(BuildContext context) {
    final label = AppLocalizations.of(context)
        .onboardingStepOf(step, _stepCount);
    return Semantics(
      container: true,
      liveRegion: true,
      label: label,
      child: ExcludeSemantics(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyles.label.copyWith(color: AppColors.encreDouce),
            ),
            const SizedBox(height: AppDimens.spaceS),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
              child: SizedBox(
                height: _barHeight,
                child: Stack(
                  children: [
                    const Positioned.fill(
                      child: ColoredBox(color: AppColors.ligne),
                    ),
                    Positioned.fill(
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: step / _stepCount,
                        child: const ColoredBox(color: AppColors.encre),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Choix plat : 48 dp minimum, sélection annoncée et marquée par la couleur
/// et l'épaisseur du contour (pas par la couleur seule).
class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppDimens.radiusMedium);
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      onTap: onTap,
      child: Material(
        color: selected ? AppColors.braiseDouce : AppColors.blanc,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(
            color: selected ? AppColors.braiseTexte : AppColors.ligne,
            width: selected
                ? AppDimens.borderWidthFocus
                : AppDimens.borderWidth,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: AppDimens.minTouchTarget,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.spaceM,
                vertical: AppDimens.spaceS,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: 1,
                child: Text(
                  label,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: selected ? AppColors.braiseTexte : AppColors.encre,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryChoices extends StatelessWidget {
  const _CategoryChoices({required this.selected, required this.onToggle});

  final Set<OutingCategory> selected;
  final ValueChanged<OutingCategory> onToggle;

  static String _label(AppLocalizations l10n, OutingCategory c) => switch (c) {
    OutingCategory.bars => l10n.onboardingCategoryBars,
    OutingCategory.restaurants => l10n.onboardingCategoryRestaurants,
    OutingCategory.games => l10n.onboardingCategoryGames,
    OutingCategory.karaoke => l10n.onboardingCategoryKaraoke,
    OutingCategory.outdoors => l10n.onboardingCategoryOutdoors,
    OutingCategory.concerts => l10n.onboardingCategoryConcerts,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Wrap(
      spacing: AppDimens.spaceS,
      runSpacing: AppDimens.spaceS,
      children: [
        for (final c in OutingCategory.values)
          _ChoiceTile(
            label: _label(l10n, c),
            selected: selected.contains(c),
            onTap: () => onToggle(c),
          ),
      ],
    );
  }
}

class _BudgetChoices extends StatelessWidget {
  const _BudgetChoices({required this.selected, required this.onSelect});

  final BudgetRange? selected;
  final ValueChanged<BudgetRange> onSelect;

  static String _label(AppLocalizations l10n, BudgetRange b) => switch (b) {
    BudgetRange.under15 => l10n.onboardingBudgetUnder15,
    BudgetRange.from15to30 => l10n.onboardingBudgetFrom15to30,
    BudgetRange.from30to50 => l10n.onboardingBudgetFrom30to50,
    BudgetRange.over50 => l10n.onboardingBudgetOver50,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Wrap(
      spacing: AppDimens.spaceS,
      runSpacing: AppDimens.spaceS,
      children: [
        for (final b in BudgetRange.values)
          _ChoiceTile(
            label: _label(l10n, b),
            selected: selected == b,
            onTap: () => onSelect(b),
          ),
      ],
    );
  }
}

class _ZoneChoices extends StatelessWidget {
  const _ZoneChoices({required this.selected, required this.onSelect});

  final AreaZone? selected;
  final ValueChanged<AreaZone> onSelect;

  // Zones fictives : coordonnées arrondies à ~500 m, jamais d'adresse exacte.
  static List<AreaZone> _zones(AppLocalizations l10n) => [
    AreaZone.approximate(
      label: l10n.onboardingZoneParis,
      latitude: 48.8566,
      longitude: 2.3522,
    ),
    AreaZone.approximate(
      label: l10n.onboardingZoneParisNordEst,
      latitude: 48.8722,
      longitude: 2.3797,
    ),
    AreaZone.approximate(
      label: l10n.onboardingZoneLyon,
      latitude: 45.7640,
      longitude: 4.8357,
    ),
    AreaZone.approximate(
      label: l10n.onboardingZoneMarseille,
      latitude: 43.2951,
      longitude: 5.3744,
    ),
    AreaZone.approximate(
      label: l10n.onboardingZoneBordeaux,
      latitude: 44.8378,
      longitude: -0.5792,
    ),
    AreaZone.approximate(
      label: l10n.onboardingZoneLille,
      latitude: 50.6292,
      longitude: 3.0573,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final zone in _zones(l10n)) ...[
          _ChoiceTile(
            label: zone.label,
            selected: selected == zone,
            onTap: () => onSelect(zone),
          ),
          const SizedBox(height: AppDimens.spaceS),
        ],
      ],
    );
  }
}

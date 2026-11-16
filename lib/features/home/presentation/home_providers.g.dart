// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeRepository)
final homeRepositoryProvider = HomeRepositoryProvider._();

final class HomeRepositoryProvider
    extends $FunctionalProvider<HomeRepository, HomeRepository, HomeRepository>
    with $Provider<HomeRepository> {
  HomeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRepository create(Ref ref) {
    return homeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRepository>(value),
    );
  }
}

String _$homeRepositoryHash() => r'e8a7f6fce4a03cd238f48a316c1a0397718bf0af';

/// Contenu de l'accueil, sans nouvelle tentative automatique.

@ProviderFor(homeOverview)
final homeOverviewProvider = HomeOverviewProvider._();

/// Contenu de l'accueil, sans nouvelle tentative automatique.

final class HomeOverviewProvider
    extends
        $FunctionalProvider<
          AsyncValue<HomeOverview>,
          HomeOverview,
          FutureOr<HomeOverview>
        >
    with $FutureModifier<HomeOverview>, $FutureProvider<HomeOverview> {
  /// Contenu de l'accueil, sans nouvelle tentative automatique.
  HomeOverviewProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'homeOverviewProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeOverviewHash();

  @$internal
  @override
  $FutureProviderElement<HomeOverview> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HomeOverview> create(Ref ref) {
    return homeOverview(ref);
  }
}

String _$homeOverviewHash() => r'a1da13ff613ff21b4946a61d98dcb593301c8781';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outing_planner_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(outingPlannerRepository)
final outingPlannerRepositoryProvider = OutingPlannerRepositoryProvider._();

final class OutingPlannerRepositoryProvider
    extends
        $FunctionalProvider<
          OutingPlannerRepository,
          OutingPlannerRepository,
          OutingPlannerRepository
        >
    with $Provider<OutingPlannerRepository> {
  OutingPlannerRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'outingPlannerRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$outingPlannerRepositoryHash();

  @$internal
  @override
  $ProviderElement<OutingPlannerRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OutingPlannerRepository create(Ref ref) {
    return outingPlannerRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OutingPlannerRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OutingPlannerRepository>(value),
    );
  }
}

String _$outingPlannerRepositoryHash() =>
    r'9a4af0b72aa5ccf5f0516ca42c1e7ee165b75616';

@ProviderFor(outingGroups)
final outingGroupsProvider = OutingGroupsProvider._();

final class OutingGroupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OutingGroup>>,
          List<OutingGroup>,
          FutureOr<List<OutingGroup>>
        >
    with
        $FutureModifier<List<OutingGroup>>,
        $FutureProvider<List<OutingGroup>> {
  OutingGroupsProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'outingGroupsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$outingGroupsHash();

  @$internal
  @override
  $FutureProviderElement<List<OutingGroup>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OutingGroup>> create(Ref ref) {
    return outingGroups(ref);
  }
}

String _$outingGroupsHash() => r'8d2caf90ed1bcf034a9df499faafd150c5f641c3';

/// Créneaux du groupe sélectionné dans le brouillon (vide sans groupe).

@ProviderFor(outingSlots)
final outingSlotsProvider = OutingSlotsProvider._();

/// Créneaux du groupe sélectionné dans le brouillon (vide sans groupe).

final class OutingSlotsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TimeSlot>>,
          List<TimeSlot>,
          FutureOr<List<TimeSlot>>
        >
    with $FutureModifier<List<TimeSlot>>, $FutureProvider<List<TimeSlot>> {
  /// Créneaux du groupe sélectionné dans le brouillon (vide sans groupe).
  OutingSlotsProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'outingSlotsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$outingSlotsHash();

  @$internal
  @override
  $FutureProviderElement<List<TimeSlot>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TimeSlot>> create(Ref ref) {
    return outingSlots(ref);
  }
}

String _$outingSlotsHash() => r'c436c1964d804ce5c153dc786445204cd0765ffc';

/// Étiquettes détectées dans l'envie du brouillon.

@ProviderFor(outingWishTags)
final outingWishTagsProvider = OutingWishTagsProvider._();

/// Étiquettes détectées dans l'envie du brouillon.

final class OutingWishTagsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  /// Étiquettes détectées dans l'envie du brouillon.
  OutingWishTagsProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'outingWishTagsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$outingWishTagsHash();

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    return outingWishTags(ref);
  }
}

String _$outingWishTagsHash() => r'ad8c31d4611ccef91ff1ae596db06f9227da2bfb';

/// Propositions pour le brouillon courant.

@ProviderFor(outingProposals)
final outingProposalsProvider = OutingProposalsProvider._();

/// Propositions pour le brouillon courant.

final class OutingProposalsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PlaceProposal>>,
          List<PlaceProposal>,
          FutureOr<List<PlaceProposal>>
        >
    with
        $FutureModifier<List<PlaceProposal>>,
        $FutureProvider<List<PlaceProposal>> {
  /// Propositions pour le brouillon courant.
  OutingProposalsProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'outingProposalsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$outingProposalsHash();

  @$internal
  @override
  $FutureProviderElement<List<PlaceProposal>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PlaceProposal>> create(Ref ref) {
    return outingProposals(ref);
  }
}

String _$outingProposalsHash() => r'dc3a784608490c2276b1c7e73ebb54937d146f9d';

/// Choix de l'utilisateur, gardés entre les deux écrans.

@ProviderFor(OutingDraftController)
final outingDraftControllerProvider = OutingDraftControllerProvider._();

/// Choix de l'utilisateur, gardés entre les deux écrans.
final class OutingDraftControllerProvider
    extends $NotifierProvider<OutingDraftController, OutingDraft> {
  /// Choix de l'utilisateur, gardés entre les deux écrans.
  OutingDraftControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'outingDraftControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$outingDraftControllerHash();

  @$internal
  @override
  OutingDraftController create() => OutingDraftController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OutingDraft value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OutingDraft>(value),
    );
  }
}

String _$outingDraftControllerHash() =>
    r'bb7c2cff76292c38507bf1b72fe245489c859243';

/// Choix de l'utilisateur, gardés entre les deux écrans.

abstract class _$OutingDraftController extends $Notifier<OutingDraft> {
  OutingDraft build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<OutingDraft, OutingDraft>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OutingDraft, OutingDraft>,
              OutingDraft,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

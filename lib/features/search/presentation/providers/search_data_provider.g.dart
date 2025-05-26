// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchMusicUseCaseHash() =>
    r'5f28922185330b31cf7187315a0f5aaa0cb0a2c8';

/// See also [searchMusicUseCase].
@ProviderFor(searchMusicUseCase)
final searchMusicUseCaseProvider = Provider<SearchMusicUseCase>.internal(
  searchMusicUseCase,
  name: r'searchMusicUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchMusicUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SearchMusicUseCaseRef = ProviderRef<SearchMusicUseCase>;
String _$searchDataHash() => r'9dbfbc2d3dd4ecc365e05a2af22b0d124072d65a';

/// See also [SearchData].
@ProviderFor(SearchData)
final searchDataProvider =
    AutoDisposeAsyncNotifierProvider<SearchData, List<MusicItemModel>>.internal(
      SearchData.new,
      name: r'searchDataProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchDataHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchData = AutoDisposeAsyncNotifier<List<MusicItemModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

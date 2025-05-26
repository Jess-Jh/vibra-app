// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_tracks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumTracksHash() => r'0d2721bc8ab7e8498a8db921e7fec641ccfb6086';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [albumTracks].
@ProviderFor(albumTracks)
const albumTracksProvider = AlbumTracksFamily();

/// See also [albumTracks].
class AlbumTracksFamily extends Family<AsyncValue<List<MusicItemModel>>> {
  /// See also [albumTracks].
  const AlbumTracksFamily();

  /// See also [albumTracks].
  AlbumTracksProvider call(String albumId) {
    return AlbumTracksProvider(albumId);
  }

  @override
  AlbumTracksProvider getProviderOverride(
    covariant AlbumTracksProvider provider,
  ) {
    return call(provider.albumId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'albumTracksProvider';
}

/// See also [albumTracks].
class AlbumTracksProvider
    extends AutoDisposeFutureProvider<List<MusicItemModel>> {
  /// See also [albumTracks].
  AlbumTracksProvider(String albumId)
    : this._internal(
        (ref) => albumTracks(ref as AlbumTracksRef, albumId),
        from: albumTracksProvider,
        name: r'albumTracksProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$albumTracksHash,
        dependencies: AlbumTracksFamily._dependencies,
        allTransitiveDependencies: AlbumTracksFamily._allTransitiveDependencies,
        albumId: albumId,
      );

  AlbumTracksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.albumId,
  }) : super.internal();

  final String albumId;

  @override
  Override overrideWith(
    FutureOr<List<MusicItemModel>> Function(AlbumTracksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AlbumTracksProvider._internal(
        (ref) => create(ref as AlbumTracksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        albumId: albumId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<MusicItemModel>> createElement() {
    return _AlbumTracksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumTracksProvider && other.albumId == albumId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, albumId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AlbumTracksRef on AutoDisposeFutureProviderRef<List<MusicItemModel>> {
  /// The parameter `albumId` of this provider.
  String get albumId;
}

class _AlbumTracksProviderElement
    extends AutoDisposeFutureProviderElement<List<MusicItemModel>>
    with AlbumTracksRef {
  _AlbumTracksProviderElement(super.provider);

  @override
  String get albumId => (origin as AlbumTracksProvider).albumId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

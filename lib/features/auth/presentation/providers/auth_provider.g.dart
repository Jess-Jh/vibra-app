// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authTokenHash() => r'3e5139d35f002b5de44d612898f6fd4689978363';

/// See also [authToken].
@ProviderFor(authToken)
final authTokenProvider = AutoDisposeFutureProvider<AuthState>.internal(
  authToken,
  name: r'authTokenProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthTokenRef = AutoDisposeFutureProviderRef<AuthState>;
String _$authHash() => r'aefc6bf9c8a5e0c05478a5336bdea17960f243fb';

/// See also [Auth].
@ProviderFor(Auth)
final authProvider = NotifierProvider<Auth, AuthState>.internal(
  Auth.new,
  name: r'authProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Auth = Notifier<AuthState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

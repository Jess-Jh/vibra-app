import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibra/features/auth/data/datasources/auth_romote_data_source.dart';
import 'package:vibra/features/auth/presentation/providers/auth_provider.dart';
import 'package:vibra/features/search/data/datasource/spotify_api_service.dart';

part 'di.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSource();
}

@Riverpod(keepAlive: true)
SpotifyApiService spotifyApiService(Ref ref) {
  final authState = ref.watch(authProvider);
  final token = authState.token;
  if (token == null) {
    throw Exception('No se ha autenticado el usuario');
  }
  return SpotifyApiService(token: token);
}

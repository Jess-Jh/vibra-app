import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibra/core/utils/spotify_api_helper.dart';
import 'package:vibra/features/search/data/datasource/spotify_api_service.dart';
import 'package:vibra/features/search/data/models/music_item_model.dart';

part 'random_tracks_provider.g.dart';

@riverpod
Future<List<MusicItemModel>> randomTracks(Ref ref) async {
  final helper = SpotifyApiHelper(ref);
  return helper.callWithAuth((token) async {
    final query = _generateRandomSearchTerm();
    final api = SpotifyApiService(token: token);
    return api.getRandomTracks(query);
  });
}

String _generateRandomSearchTerm() {
  const possible = 'abcdefghijklmnopqrstuvwxyz';
  final rand = Random();
  final randomChar = possible[rand.nextInt(possible.length)];

  // Puedes hacer que a veces devuelva dos letras para más variedad
  if (rand.nextBool()) {
    final anotherChar = possible[rand.nextInt(possible.length)];
    return '$randomChar$anotherChar';
  }

  return randomChar;
}

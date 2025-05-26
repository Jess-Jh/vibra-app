// providers/album_tracks_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibra/core/utils/spotify_api_helper.dart';
import 'package:vibra/features/search/data/datasource/spotify_api_service.dart';
import 'package:vibra/features/search/data/models/music_item_model.dart';

part 'album_tracks_provider.g.dart';

@riverpod
Future<List<MusicItemModel>> albumTracks(Ref ref, String albumId) async {
  final helper = SpotifyApiHelper(ref);
  return helper.callWithAuth((token) async {
    final api = SpotifyApiService(token: token);
    return api.getTracksFromAlbum(albumId);
  });
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vibra/core/utils/secure_storage_helper.dart';
import 'package:vibra/features/search/data/models/music_item_model.dart';

class SpotifyApiService {
  final String token;
  static const _baseUrl = 'https://api.spotify.com/v1';

  SpotifyApiService({required this.token});

  Map<String, String> get _headers => {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
  };

  Future<http.Response> _handleResponse(
    Future<http.Response> Function() request,
  ) async {
    final response = await request();
    if (response.statusCode == 401) {
      // Token expirado
      await SecureStorageHelper.deleteToken();
      throw TokenExpiredException();
    }
    return response;
  }

  Future<List<MusicItemModel>> getUserFavorites() async {
    final res = await _handleResponse(
      () => http.get(Uri.parse('$_baseUrl/me/tracks'), headers: _headers),
    );
    if (res.statusCode != 200) throw Exception('Error favoritos: ${res.body}');

    final data = json.decode(res.body);
    final items = data['items'] as List;

    return items.map((item) {
      final track = item['track'];
      return MusicItemModel(
        id: track['id'],
        name: track['name'],
        type: 'track',
        subtitle: track['artists']?.first['name'],
        imageUrl: track['album']?['images']?.first?['url'],
        previewUrl: track['preview_url'],
      );
    }).toList();
  }

  Future<void> saveTrackAsFavorite(String trackId) async {
    final url = Uri.parse('$_baseUrl/me/tracks?ids=$trackId');
    final res = await _handleResponse(() => http.put(url, headers: _headers));
    if (res.statusCode != 200 && res.statusCode != 201) {
      throw Exception('No se pudo guardar como favorito: ${res.body}');
    }
  }

  Future<void> removeTrackFromFavorites(String trackId) async {
    final url = Uri.parse('$_baseUrl/me/tracks?ids=$trackId');
    final res = await _handleResponse(
      () => http.delete(url, headers: _headers),
    );
    if (res.statusCode != 200) {
      throw Exception('No se pudo eliminar de favoritos: ${res.body}');
    }
  }

  Future<List<MusicItemModel>> getRandomTracks(String query) async {
    final queryParams = {'q': query, 'type': 'track', 'limit': '20'};
    final uri = Uri.https('api.spotify.com', '/v1/search', queryParams);
    final res = await _handleResponse(() => http.get(uri, headers: _headers));

    if (res.statusCode != 200) {
      throw Exception('Error al obtener canciones aleatorias: ${res.body}');
    }

    final data = json.decode(res.body);
    final items = data['tracks']['items'] as List;

    return items.map((track) {
      return MusicItemModel(
        id: track['id'],
        name: track['name'],
        type: 'track',
        subtitle: track['artists']?.first['name'],
        imageUrl: track['album']?['images']?.first?['url'],
        previewUrl: track['preview_url'],
      );
    }).toList();
  }

  Future<List<MusicItemModel>> search(String query) async {
    final url = Uri.parse('$_baseUrl/search?q=$query&type=track,artist,album');

    final response = await _handleResponse(
      () => http.get(url, headers: _headers),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al buscar: ${response.body}');
    }

    final data = json.decode(response.body);
    final List<MusicItemModel> results = [];

    // Tracks
    if (data['tracks']?['items'] != null) {
      for (var item in data['tracks']['items']) {
        results.add(
          MusicItemModel(
            id: item['id'],
            name: item['name'],
            type: 'track',
            subtitle: item['artists']?.first['name'],
            imageUrl: item['album']?['images']?.first?['url'],
            previewUrl: item['preview_url'],
          ),
        );
      }
    }

    // Artists
    if (data['artists']?['items'] != null) {
      for (var item in data['artists']['items']) {
        results.add(
          MusicItemModel(
            id: item['id'],
            name: item['name'],
            type: 'artist',
            subtitle: (item['genres'] as List?)?.join(', '),
            imageUrl: item['images']?.first?['url'],
          ),
        );
      }
    }

    // Albums
    if (data['albums']?['items'] != null) {
      for (var item in data['albums']['items']) {
        results.add(
          MusicItemModel(
            id: item['id'],
            name: item['name'],
            type: 'album',
            subtitle: item['artists']?.first['name'],
            imageUrl: item['images']?.first?['url'],
          ),
        );
      }
    }

    return results;
  }

  Future<List<MusicItemModel>> getTracksFromAlbum(String albumId) async {
    final url = Uri.parse('https://api.spotify.com/v1/albums/$albumId/tracks');

    final response = await _handleResponse(
      () => http.get(url, headers: _headers),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al obtener tracks del álbum: ${response.body}');
    }

    final data = json.decode(response.body);
    final List<MusicItemModel> tracks = [];

    for (var item in data['items']) {
      tracks.add(
        MusicItemModel(
          id: item['id'],
          name: item['name'],
          type: 'track',
          subtitle: item['artists']?.first['name'],
          imageUrl: null,
          previewUrl: item['preview_url'],
        ),
      );
    }

    return tracks;
  }
}

class TokenExpiredException implements Exception {
  @override
  String toString() => 'El token ha expirado';
}

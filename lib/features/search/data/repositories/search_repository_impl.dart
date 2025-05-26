import 'package:vibra/features/search/data/datasource/spotify_api_service.dart';
import 'package:vibra/features/search/data/models/music_item_model.dart';
import 'package:vibra/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SpotifyApiService api;

  SearchRepositoryImpl(this.api);

  @override
  Future<List<MusicItemModel>> searchMusic(String query) {
    return api.search(query); // ahora simplemente lo retorna
  }
}

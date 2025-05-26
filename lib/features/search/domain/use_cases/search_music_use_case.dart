import 'package:vibra/features/search/data/models/music_item_model.dart';
import 'package:vibra/features/search/domain/repositories/search_repository.dart';

class SearchMusicUseCase {
  final SearchRepository repository;

  SearchMusicUseCase(this.repository);

  Future<List<MusicItemModel>> call(String query) async {
    if (query.trim().isEmpty) return [];
    return await repository.searchMusic(query);
  }
}

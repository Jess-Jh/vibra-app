import 'package:vibra/features/search/data/models/music_item_model.dart';

abstract class SearchRepository {
  Future<List<MusicItemModel>> searchMusic(String query);
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_favorite_list_provider.g.dart';

@Riverpod(keepAlive: true)
class GetFavoriteList extends _$GetFavoriteList {
  @override
  Set<String> build() => {};

  void toggle(String id) {
    if (state.contains(id)) {
      state = {...state}..remove(id);
    } else {
      state = {...state, id};
    }
  }

  bool isFavorite(String id) => state.contains(id);
}

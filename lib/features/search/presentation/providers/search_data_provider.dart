import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibra/core/di.dart';
import 'package:vibra/features/search/data/models/music_item_model.dart';
import 'package:vibra/features/search/data/repositories/search_repository_impl.dart';
import 'package:vibra/features/search/domain/use_cases/search_music_use_case.dart';

part 'search_data_provider.g.dart';

@Riverpod(keepAlive: true)
SearchMusicUseCase searchMusicUseCase(Ref ref) {
  final api = ref.watch(spotifyApiServiceProvider);
  final repository = SearchRepositoryImpl(api);
  return SearchMusicUseCase(repository);
}

@riverpod
class SearchData extends _$SearchData {
  @override
  FutureOr<List<MusicItemModel>> build() => [];

  Future<void> search(String query) async {
    state = const AsyncLoading();
    try {
      final useCase = ref.read(searchMusicUseCaseProvider);
      final results = await useCase(query);
      state = AsyncData(results);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibra/core/utils/vibra_theme.dart';
import 'package:vibra/features/detail/presentation/pages/detail_page.dart';
import 'package:vibra/features/search/presentation/providers/get_favorite_list_provider.dart';
import 'package:vibra/features/search/presentation/providers/search_data_provider.dart';

final _debounceProvider = Provider.autoDispose<void Function(void Function())>((
  ref,
) {
  Timer? debounce;
  return (void Function() action) {
    debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 1000), action);
    ref.onDispose(() => debounce?.cancel());
  };
});

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchDataProvider);
    final searchController = ref.read(searchDataProvider.notifier);
    final textController = TextEditingController();
    final debounce = ref.watch(_debounceProvider);
    final favorites = ref.watch(getFavoriteListProvider);
    final favoritesNotifier = ref.read(getFavoriteListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buscar música',
          style: TextStyle(fontSize: 28, color: VibraColors.accent),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: textController,
              onChanged: (query) {
                debounce(() => searchController.search(query));
              },
              decoration: InputDecoration(
                hintText: 'Buscar artistas, canciones o álbumes',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final query = textController.text;
                    searchController.search(query);
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onSubmitted: (query) => searchController.search(query),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: searchState.when(
                data: (items) {
                  return items.isEmpty
                      ? Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Realiza una búsqueda para ver tu música favorita.',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            final isFav = favorites.contains(item.id);
                            return Card(
                              color: Theme.of(context).colorScheme.surface,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => DetailPage(item: item),
                                    ),
                                  );
                                },
                                leading: item.imageUrl != null
                                    ? Hero(
                                        tag: item.id,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: Image.network(
                                            item.imageUrl!,
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : const Icon(Icons.music_note),
                                title: Text(item.name),
                                subtitle: Text(
                                  '${item.type.toUpperCase()}${item.subtitle != null ? ' • ${item.subtitle}' : ''}',
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (item.previewUrl != null)
                                      IconButton(
                                        icon: const Icon(Icons.play_arrow),
                                        onPressed: () async {
                                          // final player = AudioPlayer();
                                          // await player.play(
                                          //   UrlSource(item.previewUrl!),
                                          // );
                                        },
                                      ),
                                    IconButton(
                                      icon: Icon(
                                        isFav
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: isFav ? Colors.red : null,
                                      ),
                                      onPressed: () =>
                                          favoritesNotifier.toggle(item.id),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

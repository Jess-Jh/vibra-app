import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibra/core/utils/vibra_theme.dart';
import 'package:vibra/features/home/presentation/pages/widgets/favorite_list.dart';
import 'package:vibra/features/home/presentation/pages/widgets/recommendation_list.dart';
import 'package:vibra/features/home/presentation/providers/get_favorite_tracks_provider.dart';
import 'package:vibra/features/home/presentation/providers/random_tracks_provider.dart';
import 'package:vibra/features/search/presentation/pages/search_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(getFavoriteTracksProvider);
    final randomTracksAsync = ref.watch(randomTracksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vibra App',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: VibraColors.accent,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchPage()),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(getFavoriteTracksProvider);
          ref.invalidate(randomTracksProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Tus Favoritos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              FavoriteList(favoritesAsync: favoritesAsync),

              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Recomendaciones',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              randomTracksAsync.when(
                data: (randomTracks) {
                  if (randomTracks.isEmpty) {
                    return const Center(child: Text('No hay recomendaciones'));
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: randomTracks.length,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 11,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.9,
                        ),
                    itemBuilder: (context, index) {
                      final item = randomTracks[index];
                      return RecommendationList(item: item);
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

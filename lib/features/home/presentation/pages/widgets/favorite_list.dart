import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibra/shared/presentation/pages/widgets/track_box.dart';
import 'package:vibra/features/search/data/models/music_item_model.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key, required this.favoritesAsync});

  final AsyncValue<List<MusicItemModel>> favoritesAsync;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 190,
      child: favoritesAsync.when(
        data: (favorites) {
          if (favorites.isEmpty) {
            return const Center(child: Text('No hay favoritos'));
          }
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: favorites.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = favorites[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TrackBox(item: item),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 100,
                      child: Text(
                        item.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

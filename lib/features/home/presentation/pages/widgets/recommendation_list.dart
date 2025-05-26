import 'package:flutter/material.dart';
import 'package:vibra/shared/presentation/pages/widgets/track_box.dart';
import 'package:vibra/features/search/data/models/music_item_model.dart';

class RecommendationList extends StatelessWidget {
  const RecommendationList({super.key, required this.item});

  final MusicItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item.imageUrl != null)
            TrackBox(item: item, height: 100, width: double.infinity),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              item.name,

              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              item.subtitle ?? '',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

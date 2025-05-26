import 'package:flutter/material.dart';
import 'package:vibra/features/detail/presentation/pages/detail_page.dart';
import 'package:vibra/features/search/data/models/music_item_model.dart';

class TrackBox extends StatelessWidget {
  const TrackBox({super.key, required this.item, this.height, this.width});

  final MusicItemModel item;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailPage(item: item)),
        );
      },
      child: Hero(
        tag: item.id,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            item.imageUrl ?? '',
            width: width ?? 150,
            height: height ?? 150,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

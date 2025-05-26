import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_item.freezed.dart';

@freezed
sealed class MusicItem with _$MusicItem {
  const factory MusicItem({
    required String id,
    required String name,
    required String type, // 'track', 'artist' o 'album'
    String? imageUrl,
    String? subtitle, // artista para canciones, género para artistas, etc.
    String? previewUrl, // solo para tracks
  }) = _MusicItem;
}

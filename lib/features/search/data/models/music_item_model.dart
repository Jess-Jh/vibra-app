import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_item_model.freezed.dart';
part 'music_item_model.g.dart';

@freezed
sealed class MusicItemModel with _$MusicItemModel {
  const factory MusicItemModel({
    required String id,
    required String name,
    required String type, // 'track', 'artist' o 'album'
    String? imageUrl,
    String? subtitle, // artista para canciones, género para artistas, etc.
    String? previewUrl, // solo para tracks
  }) = _MusicItemModel;

  factory MusicItemModel.fromJson(Map<String, dynamic> json) =>
      _$MusicItemModelFromJson(json);
}

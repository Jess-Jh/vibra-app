// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MusicItemModel _$MusicItemModelFromJson(Map<String, dynamic> json) =>
    _MusicItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      imageUrl: json['imageUrl'] as String?,
      subtitle: json['subtitle'] as String?,
      previewUrl: json['previewUrl'] as String?,
    );

Map<String, dynamic> _$MusicItemModelToJson(_MusicItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'imageUrl': instance.imageUrl,
      'subtitle': instance.subtitle,
      'previewUrl': instance.previewUrl,
    };

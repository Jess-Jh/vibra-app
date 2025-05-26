// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MusicItem {

 String get id; String get name; String get type;// 'track', 'artist' o 'album'
 String? get imageUrl; String? get subtitle;// artista para canciones, género para artistas, etc.
 String? get previewUrl;
/// Create a copy of MusicItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicItemCopyWith<MusicItem> get copyWith => _$MusicItemCopyWithImpl<MusicItem>(this as MusicItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,imageUrl,subtitle,previewUrl);

@override
String toString() {
  return 'MusicItem(id: $id, name: $name, type: $type, imageUrl: $imageUrl, subtitle: $subtitle, previewUrl: $previewUrl)';
}


}

/// @nodoc
abstract mixin class $MusicItemCopyWith<$Res>  {
  factory $MusicItemCopyWith(MusicItem value, $Res Function(MusicItem) _then) = _$MusicItemCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, String? imageUrl, String? subtitle, String? previewUrl
});




}
/// @nodoc
class _$MusicItemCopyWithImpl<$Res>
    implements $MusicItemCopyWith<$Res> {
  _$MusicItemCopyWithImpl(this._self, this._then);

  final MusicItem _self;
  final $Res Function(MusicItem) _then;

/// Create a copy of MusicItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? imageUrl = freezed,Object? subtitle = freezed,Object? previewUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _MusicItem implements MusicItem {
  const _MusicItem({required this.id, required this.name, required this.type, this.imageUrl, this.subtitle, this.previewUrl});
  

@override final  String id;
@override final  String name;
@override final  String type;
// 'track', 'artist' o 'album'
@override final  String? imageUrl;
@override final  String? subtitle;
// artista para canciones, género para artistas, etc.
@override final  String? previewUrl;

/// Create a copy of MusicItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicItemCopyWith<_MusicItem> get copyWith => __$MusicItemCopyWithImpl<_MusicItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,imageUrl,subtitle,previewUrl);

@override
String toString() {
  return 'MusicItem(id: $id, name: $name, type: $type, imageUrl: $imageUrl, subtitle: $subtitle, previewUrl: $previewUrl)';
}


}

/// @nodoc
abstract mixin class _$MusicItemCopyWith<$Res> implements $MusicItemCopyWith<$Res> {
  factory _$MusicItemCopyWith(_MusicItem value, $Res Function(_MusicItem) _then) = __$MusicItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, String? imageUrl, String? subtitle, String? previewUrl
});




}
/// @nodoc
class __$MusicItemCopyWithImpl<$Res>
    implements _$MusicItemCopyWith<$Res> {
  __$MusicItemCopyWithImpl(this._self, this._then);

  final _MusicItem _self;
  final $Res Function(_MusicItem) _then;

/// Create a copy of MusicItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? imageUrl = freezed,Object? subtitle = freezed,Object? previewUrl = freezed,}) {
  return _then(_MusicItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

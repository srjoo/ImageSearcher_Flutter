// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageSearchModel _$ImageSearchModelFromJson(Map<String, dynamic> json) =>
    ImageSearchModel(
      collection: json['collection'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
      displaySiteName: json['display_sitename'] as String,
      docUrl: json['doc_url'] as String,
      imageUrl: json['image_url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$ImageSearchModelToJson(ImageSearchModel instance) =>
    <String, dynamic>{
      'collection': instance.collection,
      'datetime': instance.datetime.toIso8601String(),
      'display_sitename': instance.displaySiteName,
      'doc_url': instance.docUrl,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'width': instance.width,
      'height': instance.height,
    };

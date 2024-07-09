// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      displaySiteName: json['display_sitename'] as String,
      docUrl: json['doc_url'] as String,
      imageUrl: json['image_url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'display_sitename': instance.displaySiteName,
      'doc_url': instance.docUrl,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
    };

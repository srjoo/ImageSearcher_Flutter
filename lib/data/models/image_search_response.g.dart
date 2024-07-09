// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageSearchResponse _$ImageSearchResponseFromJson(Map<String, dynamic> json) =>
    ImageSearchResponse(
      meta: ImageSearchMeta.fromJson(json['meta'] as Map<String, dynamic>),
      documents: (json['documents'] as List<dynamic>)
          .map((e) => ImageSearchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageSearchResponseToJson(
        ImageSearchResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'documents': instance.documents.map((e) => e.toJson()).toList(),
    };

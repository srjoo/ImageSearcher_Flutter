// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_search_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageSearchMeta _$ImageSearchMetaFromJson(Map<String, dynamic> json) =>
    ImageSearchMeta(
      isEnd: json['is_end'] as bool,
      pageCount: (json['pageable_count'] as num).toInt(),
      totalCount: (json['total_count'] as num).toInt(),
    );

Map<String, dynamic> _$ImageSearchMetaToJson(ImageSearchMeta instance) =>
    <String, dynamic>{
      'is_end': instance.isEnd,
      'pageable_count': instance.pageCount,
      'total_count': instance.totalCount,
    };

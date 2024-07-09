// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageResultModel _$ImageResultModelFromJson(Map<String, dynamic> json) =>
    ImageResultModel(
      isEnd: json['isEnd'] as bool,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageResultModelToJson(ImageResultModel instance) =>
    <String, dynamic>{
      'isEnd': instance.isEnd,
      'images': instance.images.map((e) => e.toJson()).toList(),
    };

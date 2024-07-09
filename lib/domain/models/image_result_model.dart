import 'package:image_searcher/domain/models/image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_result_model.g.dart';

@JsonSerializable(explicitToJson:true)
class ImageResultModel {
  final bool isEnd;
  final List<ImageModel> images;

  ImageResultModel({
    required this.isEnd,
    required this.images
  });

  factory ImageResultModel.fromJson(Map<String, dynamic> json) => _$ImageResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageResultModelToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

part 'image_search_model.g.dart';

@JsonSerializable()
class ImageSearchModel {
  final String collection;
  final DateTime datetime;
  @JsonKey(name: 'display_sitename')
  final String displaySiteName;
  @JsonKey(name: 'doc_url')
  final String docUrl;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'thumbnail_url')
  final String thumbnailUrl;
  final int width;
  final int height;

  ImageSearchModel({
    required this.collection,
    required this.datetime,
    required this.displaySiteName,
    required this.docUrl,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.width,
    required this.height,
  });

  factory ImageSearchModel.fromJson(Map<String, dynamic> json) => _$ImageSearchModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageSearchModelToJson(this);
}
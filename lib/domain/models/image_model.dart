import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  @JsonKey(name: 'display_sitename')
  final String displaySiteName;
  @JsonKey(name: 'doc_url')
  final String docUrl;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @JsonKey(name: 'thumbnail_url')
  final String thumbnailUrl;

  ImageModel({
    required this.displaySiteName,
    required this.docUrl,
    required this.imageUrl,
    required this.thumbnailUrl
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is ImageModel && imageUrl == other.imageUrl);
  }

  @override
  int get hashCode => imageUrl.hashCode;
}
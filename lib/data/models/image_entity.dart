import 'package:json_annotation/json_annotation.dart';
import 'package:image_searcher/data/db/image_database.dart';

part 'image_entity.g.dart';

@JsonSerializable()
class ImageEntity {
  @JsonKey(name: ImageFields.displaySiteName)
  final String displaySiteName;
  @JsonKey(name: ImageFields.docUrl)
  final String docUrl;
  @JsonKey(name: ImageFields.imageUrl)
  final String imageUrl;
  @JsonKey(name: ImageFields.thumbnailUrl)
  final String thumbnailUrl;

  ImageEntity({
    required this.displaySiteName,
    required this.docUrl,
    required this.imageUrl,
    required this.thumbnailUrl
  });

  factory ImageEntity.fromJson(Map<String, dynamic> json) => _$ImageEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ImageEntityToJson(this);
}
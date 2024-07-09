import 'package:json_annotation/json_annotation.dart';
import 'package:image_searcher/data/models/image_search_meta.dart';
import 'package:image_searcher/data/models/image_search_model.dart';

part 'image_search_response.g.dart';

@JsonSerializable(explicitToJson:true)
class ImageSearchResponse {
  final ImageSearchMeta meta;
  final List<ImageSearchModel> documents;

  ImageSearchResponse({
    required this.meta,
    required this.documents
  });

  factory ImageSearchResponse.fromJson(Map<String, dynamic> json) => _$ImageSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImageSearchResponseToJson(this);
}
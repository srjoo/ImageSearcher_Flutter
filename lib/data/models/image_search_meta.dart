import 'package:json_annotation/json_annotation.dart';

part 'image_search_meta.g.dart';

@JsonSerializable()
class ImageSearchMeta {
  @JsonKey(name: 'is_end')
  final bool isEnd;
  @JsonKey(name: 'pageable_count')
  final int pageCount;
  @JsonKey(name: 'total_count')
  final int totalCount;

  ImageSearchMeta({
    required this.isEnd,
    required this.pageCount,
    required this.totalCount
  });

  factory ImageSearchMeta.fromJson(Map<String, dynamic> json) => _$ImageSearchMetaFromJson(json);
  Map<String, dynamic> toJson() => _$ImageSearchMetaToJson(this);
}
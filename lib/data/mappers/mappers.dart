import 'package:image_searcher/data/models/image_entity.dart';
import 'package:image_searcher/data/models/image_search_model.dart';
import 'package:image_searcher/data/models/image_search_response.dart';
import 'package:image_searcher/domain/models/image_model.dart';
import 'package:image_searcher/domain/models/image_result_model.dart';

ImageModel toImageModel(ImageSearchModel model) =>
  ImageModel(displaySiteName: model.displaySiteName,
      docUrl: model.docUrl,
      imageUrl: model.imageUrl,
      thumbnailUrl: model.thumbnailUrl);

ImageResultModel toImageResultModel(ImageSearchResponse response) =>
    ImageResultModel(isEnd: response.meta.isEnd,
        images:response.documents.map((toElement) => toImageModel(toElement)).toList());

ImageModel entityToImageModel(ImageEntity entity) =>
    ImageModel(displaySiteName: entity.displaySiteName,
        docUrl: entity.docUrl,
        imageUrl: entity.imageUrl,
        thumbnailUrl: entity.thumbnailUrl);

ImageEntity imageModelToEntity(ImageModel model) =>
    ImageEntity(displaySiteName: model.displaySiteName,
        docUrl: model.docUrl,
        imageUrl: model.imageUrl,
        thumbnailUrl: model.thumbnailUrl);
import 'package:image_searcher/domain/models/image_model.dart';
import 'package:image_searcher/domain/models/image_result_model.dart';

enum ImageSearchSort {
  accuracy,
  recency
}

abstract class ImageRepository {
  Future<ImageResultModel> searchFromRemote(String query, {int page = 1, int size = 20, ImageSearchSort sort = ImageSearchSort.accuracy});

  Future<List<ImageModel>> getFavoriteFromLocal();
  Future<bool> insertFavoriteToLocal(ImageModel model);
  Future<bool> deleteFavoriteToLocal(ImageModel model);
}
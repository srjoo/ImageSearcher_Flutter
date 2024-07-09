import 'package:image_searcher/domain/models/image_model.dart';

abstract class ImageLocalDataSource {
  Future<List<ImageModel>> getFavorites();
  Future<bool> insertFavorite(ImageModel model);
  Future<bool> deleteFavorite(ImageModel model);
}
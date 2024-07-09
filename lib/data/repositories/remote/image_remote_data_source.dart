import 'package:image_searcher/domain/models/image_result_model.dart';
import 'package:image_searcher/domain/repositories/image_repository.dart';

abstract class ImageRemoteDataSource {
  Future<ImageResultModel> search(String query, {int page = 1, int size = 20, ImageSearchSort sort = ImageSearchSort.accuracy});
}
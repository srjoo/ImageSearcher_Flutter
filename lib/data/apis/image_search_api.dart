import 'package:image_searcher/data/models/image_search_response.dart';
import 'package:image_searcher/domain/repositories/image_repository.dart';

abstract class ImageSearchApi {
  Future<ImageSearchResponse> search(String query, {int page = 1, int size = 20, ImageSearchSort sort = ImageSearchSort.accuracy});
}
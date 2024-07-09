import 'package:image_searcher/domain/models/image_result_model.dart';
import 'package:image_searcher/domain/repositories/image_repository.dart';

class GetPagingImagesUsecase {
  final ImageRepository _repository;

  GetPagingImagesUsecase(this._repository);

  Future<ImageResultModel> execute(String query, {int page = 1, int size = 20, ImageSearchSort sort = ImageSearchSort.accuracy})
  => _repository.searchFromRemote(query,
    page: page,
    size: size,
    sort: sort
  );
}
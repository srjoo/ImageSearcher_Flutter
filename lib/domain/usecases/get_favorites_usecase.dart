import 'package:image_searcher/domain/repositories/image_repository.dart';
import 'package:image_searcher/domain/models/image_model.dart';

class GetFavoritesUsecase {
  final ImageRepository _repository;

  GetFavoritesUsecase(this._repository);

  Future<List<ImageModel>> execute()
  => _repository.getFavoriteFromLocal();
}
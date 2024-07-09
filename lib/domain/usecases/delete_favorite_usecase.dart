import 'package:image_searcher/domain/repositories/image_repository.dart';
import 'package:image_searcher/domain/models/image_model.dart';

class DeleteFavoriteUsecase {
  final ImageRepository _repository;

  DeleteFavoriteUsecase(this._repository);

  Future<bool> execute(ImageModel model)
  => _repository.deleteFavoriteToLocal(model);
}
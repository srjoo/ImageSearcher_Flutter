import 'package:image_searcher/domain/models/image_model.dart';
import 'package:image_searcher/domain/repositories/image_repository.dart';

class InsertFavoriteUsecase {
  final ImageRepository _repository;

  InsertFavoriteUsecase(this._repository);

  Future<bool> execute(ImageModel model)
  => _repository.insertFavoriteToLocal(model);
}
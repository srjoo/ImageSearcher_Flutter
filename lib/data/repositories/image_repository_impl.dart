import 'package:image_searcher/domain/models/image_model.dart';
import 'package:image_searcher/domain/models/image_result_model.dart';
import 'package:image_searcher/domain/repositories/image_repository.dart';
import 'package:image_searcher/data/repositories/local/image_local_data_source.dart';
import 'package:image_searcher/data/repositories/remote/image_remote_data_source.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageLocalDataSource _local;
  final ImageRemoteDataSource _remote;

  ImageRepositoryImpl(this._local, this._remote);

  @override
  Future<bool> deleteFavoriteToLocal(ImageModel model) {
    return _local.deleteFavorite(model);
  }

  @override
  Future<List<ImageModel>> getFavoriteFromLocal() {
    return _local.getFavorites();
  }

  @override
  Future<bool> insertFavoriteToLocal(ImageModel model) {
    return _local.insertFavorite(model);
  }

  @override
  Future<ImageResultModel> searchFromRemote(String query, {int page = 1, int size = 20, ImageSearchSort sort = ImageSearchSort.accuracy}) {
    return _remote.search(query,
      page: page,
      size: size,
      sort: sort
    );
  }
}

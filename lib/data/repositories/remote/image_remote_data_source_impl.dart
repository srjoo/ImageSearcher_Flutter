import 'package:image_searcher/domain/models/image_result_model.dart';
import 'package:image_searcher/domain/repositories/image_repository.dart';
import 'package:image_searcher/data/apis/image_search_api.dart';
import 'package:image_searcher/data/repositories/remote/image_remote_data_source.dart';
import 'package:image_searcher/data/mappers/mappers.dart' as mappers;

class ImageRemoteDataSourceImpl implements ImageRemoteDataSource {
  final ImageSearchApi _api;

  ImageRemoteDataSourceImpl(this._api);

  @override
  Future<ImageResultModel> search(String query, {int page = 1, int size = 20, ImageSearchSort sort = ImageSearchSort.accuracy}) async {
    var r = await _api.search(query,
      page: page,
      size: size,
      sort: sort
    );
    return mappers.toImageResultModel(r);
  }
}
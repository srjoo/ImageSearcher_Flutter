import 'package:image_searcher/data/db/image_dao.dart';
import 'package:image_searcher/data/repositories/local/image_local_data_source.dart';
import 'package:image_searcher/domain/models/image_model.dart';
import 'package:image_searcher/data/mappers/mappers.dart' as mappers;

class ImageLocalDataSourceImpl implements ImageLocalDataSource {
  final ImageDao dao;

  ImageLocalDataSourceImpl(this.dao);

  @override
  Future<bool> deleteFavorite(ImageModel model) async {
    var r = await dao.delete(mappers.imageModelToEntity(model));
    return r > 0;
  }

  @override
  Future<List<ImageModel>> getFavorites() async {
    var r = await dao.getAll();
    return r.map((entity) => mappers.entityToImageModel(entity)).toList();
  }

  @override
  Future<bool> insertFavorite(ImageModel model) async {
    var r = await dao.insert(mappers.imageModelToEntity(model));
    return r > 0;
  }
}

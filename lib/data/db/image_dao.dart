import 'package:image_searcher/data/models/image_entity.dart';

abstract class ImageDao {
  Future<int> insert(ImageEntity image);
  Future<int> delete(ImageEntity image);
  Future<List<ImageEntity>> getAll();
}
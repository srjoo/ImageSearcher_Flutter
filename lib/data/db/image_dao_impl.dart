import 'package:sqflite/sqflite.dart';
import 'package:image_searcher/data/db/image_dao.dart';
import 'package:image_searcher/data/db/image_database.dart';
import 'package:image_searcher/data/models/image_entity.dart';

class ImageDaoImpl implements ImageDao {
  static final ImageDaoImpl instance = ImageDaoImpl._();

  ImageDaoImpl._();

  Future<Database> _db() {
    return ImageDatabase.instance.database;
  }

  @override
  Future<int> insert(ImageEntity image) async {
    final db = await _db();

    return await db.insert(ImageDatabase.dbTableName, image.toJson());
  }

  @override
  Future<int> delete(ImageEntity image) async {
    final db = await _db();

    return await db.delete(ImageDatabase.dbTableName,
      where: '${ImageFields.imageUrl} = ?',
      whereArgs: [image.imageUrl],
    );
  }

  @override
  Future<List<ImageEntity>> getAll() async {
    final db = await _db();
    final result = await db.query(ImageDatabase.dbTableName);
    return result.map((json) => ImageEntity.fromJson(json)).toList();
  }
}
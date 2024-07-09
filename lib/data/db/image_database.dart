import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ImageDatabase {
  static const dbTableName = 'image';
  static const _dbFileName = 'favorite_images.db';
  static const _dbVersion = 1;

  static final ImageDatabase instance = ImageDatabase._();
  static Database? _database;

  ImageDatabase._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _open(_dbFileName);
    return _database!;
  }

  Future<Database> _open(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: _dbVersion, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $dbTableName (
      ${ImageFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${ImageFields.displaySiteName} TEXT NOT NULL,
      ${ImageFields.docUrl} TEXT NOT NULL,
      ${ImageFields.imageUrl} TEXT NOT NULL,
      ${ImageFields.thumbnailUrl} TEXT NOT NULL
    )
    ''');
  }
}

class ImageFields {
  static const List<String> values = [
    id, displaySiteName, docUrl, imageUrl, thumbnailUrl
  ];

  static const String id = '_id';
  static const String displaySiteName = 'displaySiteName';
  static const String docUrl = 'docUrl';
  static const String imageUrl = 'imageUrl';
  static const String thumbnailUrl = 'thumbnailUrl';
}
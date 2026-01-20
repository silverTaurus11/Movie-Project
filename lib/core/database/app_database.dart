import 'package:dummy_project/core/database/schema.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'db_config_loader.dart';

class AppDatabase {
  static Database? _database;

  static Future<Database> instance() async {
    if (_database != null) return _database!;

    final config = await DbConfigLoader.load();

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, config.dbName);

    _database = await openDatabase(
      path,
      version: config.dbVersion,
      onCreate: _onCreate,
    );

    return _database!;
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute(DbSchema.createMovies);
    await db.execute(DbSchema.createMovieCast);
    await db.execute(DbSchema.createMovieVideos);
  }
}

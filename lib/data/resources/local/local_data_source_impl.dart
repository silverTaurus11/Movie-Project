import 'package:dummy_project/core/app_logger.dart';
import 'package:dummy_project/data/model/cast_model.dart';
import 'package:dummy_project/data/model/movie_model.dart';
import 'package:dummy_project/data/model/video_model.dart';
import 'package:dummy_project/data/resources/remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/database/app_database.dart';

@LazySingleton(as: MovieLocalDataSource)
class LocalDataSourceImpl implements MovieLocalDataSource {
  LocalDataSourceImpl();

  @override
  Future<List<MovieModel>> getTopRatedMovies({int page = 1}) async {
    final db = await AppDatabase.instance();

    final rows = await db.query('movies', orderBy: 'vote_average DESC');

    return rows.map(MovieModel.fromJson).toList();
  }

  @override
  Future<MovieModel?> getMovieDetail(int movieId) async {
    final db = await AppDatabase.instance();

    final rows = await db.query(
      'movies',
      where: 'id = ?',
      whereArgs: [movieId],
      limit: 1,
    );

    if (rows.isEmpty) return null;
    return MovieModel.fromJson(rows.first);
  }

  @override
  Future<List<CastModel>> getMovieCast(int movieId) async {
    final db = await AppDatabase.instance();

    final rows = await db.query(
      'movie_cast',
      where: 'movie_id = ?',
      whereArgs: [movieId],
    );

    return rows.map(CastModel.fromJson).toList();
  }

  @override
  Future<List<MovieVideoModel>> getMovieVideos(int movieId) async {
    final db = await AppDatabase.instance();

    final rows = await db.query(
      'movie_videos',
      where: 'movie_id = ?',
      whereArgs: [movieId],
    );

    return rows.map(MovieVideoModel.fromJson).toList();
  }

  @override
  Future<void> upsertCast(int movieId, List<CastModel> cast) async {
    final db = await AppDatabase.instance();

    await db.transaction((txn) async {
      for (final i in cast) {
        await txn.insert(
          'movie_cast',
          i.toJson(movieId),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  @override
  Future<void> upsertMovie(MovieModel movie) async {
    final db = await AppDatabase.instance();

    await db.insert(
      'movies',
      movie.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> upsertMovies(List<MovieModel> movies) async {
    final db = await AppDatabase.instance();

    await db.transaction((txn) async {
      for (final movie in movies) {
        AppLogger.d(movie.title);
        await txn.insert(
          'movies',
          movie.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  @override
  Future<void> upsertVideos(int movieId, List<MovieVideoModel> videos) async {
    final db = await AppDatabase.instance();

    await db.transaction((txn) async {
      for (final video in videos) {
        await txn.insert(
          'movie_videos',
          video.toJson(movieId),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }
}

import 'package:dummy_project/data/model/cast_model.dart';
import 'package:dummy_project/data/model/movie_model.dart';
import 'package:dummy_project/data/model/video_model.dart';
import 'package:dummy_project/data/resources/remote_data_source.dart';
import 'package:injectable/injectable.dart';

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
}

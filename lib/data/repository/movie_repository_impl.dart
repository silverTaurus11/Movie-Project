import 'dart:convert';

import 'package:dummy_project/core/app_logger.dart';
import 'package:dummy_project/domain/model/cast_item.dart';
import 'package:dummy_project/domain/model/movie_item.dart';
import 'package:dummy_project/data/resources/remote_data_source.dart';
import 'package:dummy_project/domain/model/video_item.dart';
import 'package:dummy_project/domain/repository/movie_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    return localDataSource.getTopRatedMovies(page: page);
  }

  @override
  Future<List<Cast>> getMovieCast(int movieId) {
    return localDataSource.getMovieCast(movieId);
  }

  @override
  Future<Movie?> getMovieDetail(int movieId) {
    return localDataSource.getMovieDetail(movieId);
  }

  @override
  Future<List<MovieVideo>> getMovieVideos(int movieId) {
    return localDataSource.getMovieVideos(movieId);
  }

  @override
  Future<void> syncMovieDetail(int movieId) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(movieId);
      if (movie != null) {
        await localDataSource.upsertMovie(movie);
      }
    } catch (e) {
      AppLogger.e(e.toString());
    }
  }

  @override
  Future<void> syncMovieCast(int movieId) async {
    try {
      final cast = await remoteDataSource.getMovieCast(movieId);
      await localDataSource.upsertCast(movieId, cast);
    } catch (e) {
      AppLogger.e(e.toString());
    }
  }

  @override
  Future<void> syncMovieVideos(int movieId) async {
    try {
      final videos = await remoteDataSource.getMovieVideos(movieId);
      await localDataSource.upsertVideos(movieId, videos);
    } catch (e) {
      AppLogger.e(e.toString());
    }
  }

  @override
  Future<void> syncTopRatedMovies({int page = 1}) async {
    try {
      final response = await remoteDataSource.getTopRatedMovies(page: page);
      await localDataSource.upsertMovies(response.results);
    } catch (e) {
      AppLogger.e(e.toString());
    }
  }
}

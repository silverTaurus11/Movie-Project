import 'package:dummy_project/domain/model/cast_item.dart';
import 'package:dummy_project/domain/model/movie_item.dart';
import 'package:dummy_project/data/resources/remote_data_source.dart';
import 'package:dummy_project/domain/model/video_item.dart';
import 'package:dummy_project/domain/repository/movie_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  //final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl({required this.localDataSource});

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
  }}
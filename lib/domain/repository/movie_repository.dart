import 'package:dummy_project/domain/model/movie_item.dart';

import '../model/cast_item.dart';
import '../model/video_item.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTopRatedMovies({int page});
  Future<Movie?> getMovieDetail(int movieId);
  Future<List<Cast>> getMovieCast(int movieId);
  Future<List<MovieVideo>> getMovieVideos(int movieId);
  Future<void> syncTopRatedMovies({int page});
  Future<void> syncMovieDetail(int movieId);
  Future<void> syncMovieCast(int movieId);
  Future<void> syncMovieVideos(int movieId);
}
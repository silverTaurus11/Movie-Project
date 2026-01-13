import '../../model/cast_model.dart';
import '../../model/movie_model.dart';
import '../../model/movie_response.dart';
import '../../model/video_model.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponse> getTopRatedMovies({int page});
  Future<MovieModel> getMovieDetail(int movieId);
  Future<List<CastModel>> getMovieCast(int movieId);
  Future<List<MovieVideoModel>> getMovieVideos(int movieId);
}
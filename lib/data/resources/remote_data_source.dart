import '../model/cast_model.dart';
import '../model/movie_model.dart';
import '../model/movie_response.dart';
import '../model/video_model.dart';

abstract class MovieDataSource {
  Future<MovieModel?> getMovieDetail(int movieId);
  Future<List<CastModel>> getMovieCast(int movieId);
  Future<List<MovieVideoModel>> getMovieVideos(int movieId);
}

abstract class MovieRemoteDataSource implements MovieDataSource {
  Future<MovieResponse> getTopRatedMovies({int page = 1});
}

abstract class MovieLocalDataSource implements MovieDataSource {
  Future<List<MovieModel>> getTopRatedMovies({int page = 1});
  Future<void> upsertMovies(List<MovieModel> movies);
  Future<void> upsertMovie(MovieModel movie);
  Future<void> upsertCast(int movieId, List<CastModel> cast);
  Future<void> upsertVideos(int movieId, List<MovieVideoModel> videos);

}
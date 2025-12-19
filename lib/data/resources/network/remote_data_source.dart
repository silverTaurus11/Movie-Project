import 'package:dummy_project/data/model/movie_response.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponse> getTopRatedMovies({int page});
}
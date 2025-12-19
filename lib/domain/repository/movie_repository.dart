import 'package:dummy_project/domain/model/movie_item.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTopRatedMovies({int page});
}
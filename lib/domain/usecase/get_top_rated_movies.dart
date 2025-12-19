import 'package:dummy_project/domain/model/get_top_rated_movies_param.dart';
import 'package:dummy_project/domain/repository/movie_repository.dart';
import 'package:injectable/injectable.dart';

import '../model/movie_item.dart';
import 'base_usecase.dart';

@injectable
class GetTopRatedMovies implements UseCase<List<Movie>, GetTopRatedMoviesParams> {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  @override
  Future<List<Movie>> call(GetTopRatedMoviesParams params) {
    return repository.getTopRatedMovies(page: params.page);
  }
}
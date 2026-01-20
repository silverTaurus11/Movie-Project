import 'package:dummy_project/domain/model/get_top_rated_movies_param.dart';

abstract class MovieEvent {}

class LoadTopRatedMovies extends MovieEvent {
  final GetTopRatedMoviesParams page;

  LoadTopRatedMovies({this.page = const GetTopRatedMoviesParams(page: 1)});
}
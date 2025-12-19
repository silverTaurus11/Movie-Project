import 'package:dummy_project/domain/usecase/get_top_rated_movies.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/state/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'event/movie_event.dart';

@injectable
class TopRatedMovieBloc extends Bloc<MovieEvent, MovieState> {
  TopRatedMovieBloc(this.getTopRatedMovies) : super(MovieInitial()) {
    on<LoadTopRatedMovies>(_onLoad);
  }

  final GetTopRatedMovies getTopRatedMovies;

  Future<void> _onLoad(
    LoadTopRatedMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());

    try {
      final movies = await getTopRatedMovies(event.page);
      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecase/get_movie_detail_with_cast.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

@injectable
class MovieDetailBloc
    extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailWithCast getMovieDetailWithCast;

  MovieDetailBloc(this.getMovieDetailWithCast)
      : super(MovieDetailInitial()) {
    on<LoadMovieDetail>(_onLoadMovieDetail);
  }

  Future<void> _onLoadMovieDetail(
      LoadMovieDetail event,
      Emitter<MovieDetailState> emit,
      ) async {
    emit(MovieDetailLoading());

    try {
      final detail = await getMovieDetailWithCast(event.movieId);
      emit(MovieDetailLoaded(detail));
    } catch (e) {
      emit(MovieDetailError('Failed to load movie detail'));
    }
  }
}

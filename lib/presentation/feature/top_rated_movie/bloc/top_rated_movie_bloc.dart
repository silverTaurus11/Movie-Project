import 'dart:async';

import 'package:dummy_project/core/app_logger.dart';
import 'package:dummy_project/domain/usecase/get_top_rated_movies.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/state/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/sync_state_notifier.dart';
import 'event/movie_event.dart';

@injectable
class TopRatedMovieBloc extends Bloc<MovieEvent, MovieState> {
  TopRatedMovieBloc(this.getTopRatedMovies, this.syncStateNotifier) : super(MovieInitial()) {
    _init();
    on<LoadTopRatedMovies>(_onLoad);
  }

  final GetTopRatedMovies getTopRatedMovies;

  final SyncStateNotifier syncStateNotifier;
  late final StreamSubscription<SyncStatus> _syncSub;

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

  void _init() {
    _syncSub = syncStateNotifier.stream.listen((status) {
      if (status == SyncStatus.done) {
        AppLogger.d("sElesai");
        add(LoadTopRatedMovies());
      }
    });
  }

  @override
  Future<void> close() {
    _syncSub.cancel();
    return super.close();
  }
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/event/movie_event.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/state/movie_state.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/top_rated_movie_bloc.dart';

class MockTopRatedMovieBloc
    extends MockBloc<MovieEvent, MovieState>
    implements TopRatedMovieBloc {}

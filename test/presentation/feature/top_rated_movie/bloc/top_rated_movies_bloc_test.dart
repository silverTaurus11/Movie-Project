import 'package:bloc_test/bloc_test.dart';
import 'package:dummy_project/domain/model/movie_item.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/event/movie_event.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/state/movie_state.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/top_rated_movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../app/mock_sync_state_notifier.dart';
import '../../../../domain/model/mock_get_top_rated_movies_params.dart';
import '../../../../domain/usecase/mock_get_top_rated_movies.dart';

void main() {
  late MockGetTopRatedMovies mockUseCase;
  late MockSyncSyncStateNotifier mockSyncSyncStateNotifier;
  late TopRatedMovieBloc bloc;
  late MockGetTopRatedMoviesParams params;

  setUp(() {
    mockUseCase = MockGetTopRatedMovies();
    mockSyncSyncStateNotifier = MockSyncSyncStateNotifier();
    bloc = TopRatedMovieBloc(mockUseCase, mockSyncSyncStateNotifier);
  });

  setUpAll(() {
    params = MockGetTopRatedMoviesParams();
    registerFallbackValue(params);
  });

  tearDown(() {
    bloc.close();
  });

  final movies = [
    Movie(
      id: 1,
      title: 'Movie A',
      overview: 'No comment',
      posterPath: 'none',
      voteAverage: 1.0,
      releaseDate: 'none',
      backdropPath: '',
      runtime: 122,
      tagline: '',
      genres: [],
    ),
    Movie(
      id: 2,
      title: 'Movie B',
      overview: 'No comment',
      posterPath: 'none',
      voteAverage: 1.0,
      releaseDate: 'none',
      backdropPath: '',
      runtime: 122,
      tagline: '',
      genres: [],
    ),
  ];

  blocTest<TopRatedMovieBloc, MovieState>(
    'emits [MovieLoading, MovieLoaded] when LoadTopRatedMovies succeeds',
    // Given
    build: () {
      when(() => mockUseCase(any())).thenAnswer((_) async => movies);
      return bloc;
    },

    // When
    act: (bloc) => bloc.add(LoadTopRatedMovies(page: params)),

    // Then
    expect: () => [MovieLoading(), MovieLoaded(movies)],

    verify: (_) {
      verify(() => mockUseCase(params)).called(1);
    },
  );

  blocTest<TopRatedMovieBloc, MovieState>(
    'emits [MovieLoading, MovieError] when use case throws exception',
    // Given
    build: () {
      when(() => mockUseCase(any())).thenThrow(Exception('Server error'));
      return bloc;
    },

    // When
    act: (bloc) => bloc.add(LoadTopRatedMovies(page: params)),

    // Then
    expect: () => [MovieLoading(), MovieError('Exception: Server error')],

    verify: (_) {
      verify(() => mockUseCase(params)).called(1);
    },
  );
}

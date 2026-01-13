import 'package:bloc_test/bloc_test.dart';
import 'package:dummy_project/domain/model/movie_item.dart';
import 'package:dummy_project/presentation/feature/component/movie_card.dart';
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/state/movie_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../helper/widget_helper.dart';
import '../bloc/mock_top_rated_movies_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  late MockTopRatedMovieBloc mockBloc;

  setUpAll(() async {
    dotenv.testLoad(
      fileInput: '''
      IMAGE_BASE_URL=https://image.tmdb.org/t/p/w500
      ''',
    );
  });

  setUp(() {
    mockBloc = MockTopRatedMovieBloc();
  });

  tearDown(() {
    mockBloc.close();
  });

  testWidgets('shows loading indicator when state is MovieLoading', (
    tester,
  ) async {
    // Given
    when(() => mockBloc.state).thenReturn(MovieLoading());
    whenListen(mockBloc, Stream<MovieState>.fromIterable([MovieLoading()]));

    // When
    await tester.pumpWidget(buildTestableTopRatedMovieScreen(bloc: mockBloc));

    // Then
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows movie grid when state is MovieLoaded', (tester) async {
    await mockNetworkImagesFor(() async {
      // Given
      final movies = [
        Movie(
          id: 1,
          title: 'Movie A',
          posterPath: '/posterA.jpg',
          voteAverage: 8.5,
          releaseDate: '2024-01-01',
          overview: '',
          backdropPath: '',
          runtime: 123,
          tagline: '',
          genres: [],
        ),
        Movie(
          id: 2,
          title: 'Movie B',
          posterPath: '/posterA.jpg',
          voteAverage: 8.5,
          releaseDate: '2024-01-01',
          overview: '',
          backdropPath: '',
          runtime: 123,
          tagline: '',
          genres: [],
        ),
      ];

      whenListen(
        mockBloc,
        Stream<MovieState>.fromIterable([MovieLoaded(movies)]),
        initialState: MovieLoaded(movies),
      );

      // When
      await tester.pumpWidget(buildTestableTopRatedMovieScreen(bloc: mockBloc));
      await tester.pump();

      // Then
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(MovieCard), findsNWidgets(movies.length));
    });
  });

  testWidgets('shows error message when state is MovieError', (tester) async {
    // Given
    const errorMessage = 'Something went wrong';

    when(() => mockBloc.state).thenReturn(MovieError(errorMessage));
    whenListen(
      mockBloc,
      Stream<MovieState>.fromIterable([MovieError(errorMessage)]),
    );

    // When
    await tester.pumpWidget(buildTestableTopRatedMovieScreen(bloc: mockBloc));

    // Then
    expect(find.text(errorMessage), findsOneWidget);
  });
}

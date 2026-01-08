import 'package:dummy_project/domain/model/get_top_rated_movies_param.dart';
import 'package:dummy_project/domain/model/movie_item.dart';
import 'package:dummy_project/domain/usecase/get_top_rated_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../data/repository/mock_repository.dart';

void main() {
  late MockMovieRepository mockRepository;
  late GetTopRatedMovies useCase;

  setUp(() {
    mockRepository = MockMovieRepository();
    useCase = GetTopRatedMovies(mockRepository);
  });

  test('should return list of movies when repository returns data', () async {
    // Given
    const page = 1;
    final params = GetTopRatedMoviesParams(page: page);

    final movies = [
      Movie(id: 1, title: 'Movie A', overview: 'No comment', posterPath: 'none', voteAverage: 1.0, releaseDate: 'none'),
      Movie(id: 2, title: 'Movie B', overview: 'No comment', posterPath: 'none', voteAverage: 1.0, releaseDate: 'none'),
    ];

    when(() => mockRepository.getTopRatedMovies(page: page))
        .thenAnswer((_) async => movies);

    // When
    final result = await useCase(params);

    // Then
    expect(result, movies);
    verify(() => mockRepository.getTopRatedMovies(page: page)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should throw exception when repository fails', () async {
    // Given
    const page = 1;
    final params = GetTopRatedMoviesParams(page: page);

    when(() => mockRepository.getTopRatedMovies(page: page))
        .thenThrow(Exception('Server error'));

    // When
    final call = useCase;

    // Then
    expect(
          () => call(params),
      throwsA(isA<Exception>()),
    );
  });

}

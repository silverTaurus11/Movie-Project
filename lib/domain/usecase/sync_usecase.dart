import 'package:dummy_project/core/app_logger.dart';
import 'package:injectable/injectable.dart';

import '../repository/movie_repository.dart';

@injectable
class SyncUseCase {
  final MovieRepository repository;

  SyncUseCase(this.repository);

  Future<void> call() async {
    await repository.syncTopRatedMovies();
    final result = await repository.getTopRatedMovies();

    if (result != null) {
      for (final movie in result) {
        await safeSync(
          () => repository.syncMovieDetail(movie.id),
          tag: 'syncMovieDetail:${movie.id}',
        );
        await safeSync(
          () => repository.syncMovieCast(movie.id),
          tag: 'syncMovieCast:${movie.id}',
        );
        await safeSync(
          () => repository.syncMovieVideos(movie.id),
          tag: 'syncMovieVideos:${movie.id}',
        );
      }
    }
  }

  Future<void> safeSync(Future<void> Function() action, {String? tag}) async {
    try {
      await action();
    } catch (e) {
      AppLogger.e(tag != null ? '[$tag] $e' : e.toString());
    }
  }
}

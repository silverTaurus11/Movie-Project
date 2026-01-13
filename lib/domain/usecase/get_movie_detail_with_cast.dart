import 'package:dummy_project/domain/model/cast_item.dart';
import 'package:dummy_project/domain/model/movie_detail.dart';
import 'package:dummy_project/domain/model/movie_item.dart';
import 'package:dummy_project/domain/model/video_item.dart';
import 'package:injectable/injectable.dart';

import '../repository/movie_repository.dart';
import 'base_usecase.dart';

@injectable
class GetMovieDetailWithCast implements UseCase<MovieDetail, int> {
  final MovieRepository repository;

  GetMovieDetailWithCast(this.repository);

  @override
  Future<MovieDetail> call(int movieId) async {
    final results = await Future.wait([
      repository.getMovieDetail(movieId),
      repository.getMovieCast(movieId),
      repository.getMovieVideos(movieId),
    ]);

    final movie = results[0] as Movie;
    final cast = (results[1] as List<Cast>).take(10).toList();
    final trailers = (results[2] as List<MovieVideo>)
        .where((v) => v.isYoutube && v.isTrailer)
        .toList();

    return MovieDetail(
      movie: movie,
      cast: cast,
      trailer: trailers.first.youtubeUrl,
    );
  }
}

import 'cast_item.dart';
import 'movie_item.dart';

class MovieDetail {
  final Movie movie;
  final List<Cast> cast;
  final String trailer;

  MovieDetail({
    required this.movie,
    required this.cast,
    required this.trailer
  });
}

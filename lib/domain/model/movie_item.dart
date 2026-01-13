class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final String tagline;
  final List<String> genres;
  final bool adult;
  final String originalLanguage;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.tagline,
    required this.genres,
    this.adult = false,
    this.originalLanguage = ''
  });
}

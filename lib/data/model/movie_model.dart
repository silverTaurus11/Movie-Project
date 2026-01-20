import 'dart:convert';

import '../../domain/model/movie_item.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.releaseDate,
    required super.runtime,
    required super.voteAverage,
    required super.tagline,
    required super.genres,
    required super.adult,
    required super.originalLanguage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? genreDecoded = jsonDecode(json['genres']);

    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      runtime: json['runtime'] ?? 0,
      voteAverage: (json['vote_average'] as num).toDouble(),
      tagline: json['tagline'] ?? '',
      genres: genreDecoded?.map((e) => e as String).toList() ?? [],
      adult: (json['adult'] as int) == 1,
      originalLanguage: json['original_language'],
    );
  }
}

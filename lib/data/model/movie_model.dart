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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'release_date': releaseDate,
      'runtime': runtime,
      'vote_average': voteAverage,
      'tagline': tagline,
      'genres': jsonEncode(genres),
      'adult': adult ? 1 : 0,
      'original_language': originalLanguage,
      'updated_at': DateTime.now().millisecondsSinceEpoch,
    };
  }


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

  factory MovieModel.fromNetwork(Map<String, dynamic> json) {
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
        genres:
        (json['genres'] as List?)?.map((e) => e['name'] as String).toList() ??
            [],
        adult: (json['adult'] as bool),
        originalLanguage: json['original_language']
    );
  }
}

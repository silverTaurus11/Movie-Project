import 'package:dummy_project/data/model/movie_model.dart';

class MovieResponse {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
        page: json['page'],
        results: (json['results'] as List)
            .map((e) => MovieModel.fromNetwork(e))
            .toList(),
        totalPages: json['total_pages'],
        totalResults: json['total_results']);
  }
}

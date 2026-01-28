import 'package:dio/dio.dart';
import 'package:dummy_project/data/locale/locale_provider.dart';
import 'package:dummy_project/data/model/video_model.dart';
import 'package:injectable/injectable.dart';

import '../../model/cast_model.dart';
import '../../model/movie_model.dart';
import '../../model/movie_response.dart';
import '../remote_data_source.dart';

@LazySingleton(as: MovieRemoteDataSource)
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;
  final LocaleProvider locale;

  MovieRemoteDataSourceImpl({required this.dio, required this.locale});

  @override
  Future<MovieResponse> getTopRatedMovies({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {'language': _mapLocaleToApi(locale), 'page': page},
    );

    return MovieResponse.fromJson(response.data);
  }

  @override
  Future<List<CastModel>> getMovieCast(int movieId) async {
    final response = await dio.get(
      '/movie/$movieId/credits',
      queryParameters: {'language': _mapLocaleToApi(locale)},
    );

    return (response.data['cast'] as List)
        .map((e) => CastModel.fromJson(e))
        .toList();
  }

  @override
  Future<MovieModel> getMovieDetail(int movieId) async {
    final response = await dio.get(
      '/movie/$movieId',
      queryParameters: {'language': _mapLocaleToApi(locale)},
    );
    return MovieModel.fromNetwork(response.data);
  }

  @override
  Future<List<MovieVideoModel>> getMovieVideos(int movieId) async {
    final response = await dio.get(
      '/movie/$movieId/videos',
      queryParameters: {'language': 'en-US'},
    );

    final results = response.data['results'] as List? ?? [];

    return results.map((e) => MovieVideoModel.fromNetwork(e)).toList();
  }

  String _mapLocaleToApi(LocaleProvider locale) {
    if (locale.current.languageCode == 'id') {
      return 'id-ID';
    }
    return 'en-US';
  }
}

import 'package:dio/dio.dart';
import 'package:dummy_project/data/model/movie_response.dart';
import 'package:dummy_project/data/resources/network/remote_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MovieRemoteDataSource)
class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;
  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<MovieResponse> getTopRatedMovies({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {
        'language': 'en-US',
        'page': page
      }
    );

    return MovieResponse.fromJson(response.data);
  }
}
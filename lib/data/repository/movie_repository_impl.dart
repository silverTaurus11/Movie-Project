import 'package:dummy_project/domain/model/movie_item.dart';
import 'package:dummy_project/data/resources/network/remote_data_source.dart';
import 'package:dummy_project/domain/repository/movie_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final response = await remoteDataSource.getTopRatedMovies(page: page);
    return response.results;
  }}
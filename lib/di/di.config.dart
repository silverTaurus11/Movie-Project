// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:dummy_project/data/locale/locale_provider.dart' as _i516;
import 'package:dummy_project/data/repository/movie_repository_impl.dart'
    as _i806;
import 'package:dummy_project/data/resources/local/local_data_source_impl.dart'
    as _i664;
import 'package:dummy_project/data/resources/network/remote_data_source_impl.dart'
    as _i120;
import 'package:dummy_project/data/resources/remote_data_source.dart' as _i623;
import 'package:dummy_project/di/network_module.dart' as _i636;
import 'package:dummy_project/domain/repository/movie_repository.dart' as _i511;
import 'package:dummy_project/domain/usecase/get_movie_detail_with_cast.dart'
    as _i683;
import 'package:dummy_project/domain/usecase/get_top_rated_movies.dart'
    as _i842;
import 'package:dummy_project/presentation/feature/detail/bloc/movie_detail_bloc.dart'
    as _i243;
import 'package:dummy_project/presentation/feature/top_rated_movie/bloc/top_rated_movie_bloc.dart'
    as _i656;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i516.LocaleProvider>(
      () => networkModule.localeProvider(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(
        gh<String>(instanceName: 'baseUrl'),
        gh<String>(instanceName: 'token'),
      ),
    );
    gh.lazySingleton<_i623.MovieLocalDataSource>(
      () => _i664.LocalDataSourceImpl(),
    );
    gh.lazySingleton<_i511.MovieRepository>(
      () => _i806.MovieRepositoryImpl(
        localDataSource: gh<_i623.MovieLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i623.MovieRemoteDataSource>(
      () => _i120.MovieRemoteDataSourceImpl(
        dio: gh<_i361.Dio>(),
        locale: gh<_i516.LocaleProvider>(),
      ),
    );
    gh.factory<_i842.GetTopRatedMovies>(
      () => _i842.GetTopRatedMovies(gh<_i511.MovieRepository>()),
    );
    gh.factory<_i683.GetMovieDetailWithCast>(
      () => _i683.GetMovieDetailWithCast(gh<_i511.MovieRepository>()),
    );
    gh.factory<_i243.MovieDetailBloc>(
      () => _i243.MovieDetailBloc(gh<_i683.GetMovieDetailWithCast>()),
    );
    gh.factory<_i656.TopRatedMovieBloc>(
      () => _i656.TopRatedMovieBloc(gh<_i842.GetTopRatedMovies>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i636.NetworkModule {}

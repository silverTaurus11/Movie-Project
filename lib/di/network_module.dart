import 'package:dio/dio.dart';
import 'package:dummy_project/data/locale/local_provider_impl.dart';
import 'package:dummy_project/data/locale/locale_provider.dart';
import 'package:dummy_project/data/resources/network/dio_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(@Named('baseUrl') String baseUrl, @Named('token') String token) {
    final client = DioClient(baseUrl: baseUrl, bearerToken: token);
    return client.dio;
  }

  @lazySingleton
  LocaleProvider localeProvider() {
    return LocaleProviderImpl();
  }
}

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../data/locale/local_provider_impl.dart';
import '../data/locale/locale_provider.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies({
  required String baseUrl,
  required String token
}) {
  getIt.registerSingleton<String>(baseUrl, instanceName: 'baseUrl');
  getIt.registerSingleton<String>(token, instanceName: 'token');
  getIt.registerLazySingleton<LocaleProvider>(
        () => LocaleProviderImpl(),
  );
  getIt.init();
}
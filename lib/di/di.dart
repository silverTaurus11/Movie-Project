import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies({required String baseUrl, required String token}) {
  getIt.registerSingleton<String>(baseUrl, instanceName: 'baseUrl');
  getIt.registerSingleton<String>(token, instanceName: 'token');
  getIt.init();
}

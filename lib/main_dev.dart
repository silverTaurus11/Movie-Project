import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'di/di.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env.dev");
  configureDependencies(
    baseUrl: dotenv.env['BASE_URL'] ?? "",
    token: dotenv.env['TOKEN'] ?? "",
  );
  runApp(const MyApp());
}

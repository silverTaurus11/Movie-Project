import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'di/di.dart';
import 'main.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env.prod");
  configureDependencies(
    baseUrl: dotenv.env['BASE_URL'] ?? "",
    token: dotenv.env['TOKEN'] ?? "",
  );
  runApp(const MyApp());
}
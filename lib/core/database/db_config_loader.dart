import 'dart:convert';
import 'package:flutter/services.dart';
import 'db_config.dart';

class DbConfigLoader {
  static DbConfig? _cached;

  static Future<DbConfig> load() async {
    if (_cached != null) return _cached!;

    final jsonString =
    await rootBundle.loadString('database/db_config.json');

    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

    _cached = DbConfig.fromJson(jsonMap);
    return _cached!;
  }
}

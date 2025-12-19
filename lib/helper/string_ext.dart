import 'package:flutter_dotenv/flutter_dotenv.dart';

extension StringExt on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  String orEmpty() {
    return this ?? '';
  }

  String toImageUrl() {
    return "${dotenv.env['IMAGE_BANNER'].orEmpty()}$this";
  }
}

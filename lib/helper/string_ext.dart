import 'package:flutter_dotenv/flutter_dotenv.dart';

extension StringExt on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  String orEmpty() {
    return this ?? '';
  }

  String toImageUrl() {
    return "${dotenv.env['IMAGE_BANNER'].orEmpty()}/w500/$this";
  }

  String toImageW780Url() {
    return "${dotenv.env['IMAGE_BANNER'].orEmpty()}/w780/$this";
  }

  String toImageW185Url() {
    return "${dotenv.env['IMAGE_BANNER'].orEmpty()}/w185/$this";
  }

  String formatDateToMMDDYYYY() {
    if (orEmpty().isEmpty) return '';

    final parts = orEmpty().split('-');
    if (parts.length != 3) return orEmpty();

    final year = parts[0];
    final month = parts[1];
    final day = parts[2];

    return '$month/$day/$year';
  }

}

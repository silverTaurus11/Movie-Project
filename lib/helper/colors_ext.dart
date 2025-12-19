import 'package:flutter/material.dart';

extension ColorsExt on Color {

  Color safeOpacity(double alpha) {
    return withAlpha((alpha * 255).round());
  }
}
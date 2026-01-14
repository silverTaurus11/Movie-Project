import 'dart:ui';

import 'locale_provider.dart';

class LocaleProviderImpl implements LocaleProvider {
  Locale _locale = const Locale('en');

  @override
  Locale get current => _locale;

  @override
  void update(Locale locale) {
    _locale = locale;
  }
}
import 'dart:ui';

abstract class LocaleProvider {
  Locale get current;
  void update(Locale locale);
}

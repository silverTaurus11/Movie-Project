import 'dart:async';
import 'package:flutter/services.dart';

class NativeSyncListener {
  static const _channel = EventChannel('movie_sync/events');

  static Stream<String> get stream =>
      _channel.receiveBroadcastStream().map((event) => event as String);
}

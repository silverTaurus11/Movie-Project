import 'dart:async';

import 'package:injectable/injectable.dart';

enum SyncStatus { idle, syncing, done, error }

@LazySingleton()
class SyncStateNotifier {
  final _controller = StreamController<SyncStatus>.broadcast();

  Stream<SyncStatus> get stream => _controller.stream;

  void syncing() => _controller.add(SyncStatus.syncing);
  void done() => _controller.add(SyncStatus.done);
  void error() => _controller.add(SyncStatus.error);

  void dispose() => _controller.close();
}

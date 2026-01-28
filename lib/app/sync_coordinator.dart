import 'package:dummy_project/app/sync_state_notifier.dart';
import 'package:dummy_project/core/app_logger.dart';
import 'package:flutter/material.dart';

import '../domain/usecase/sync_usecase.dart';

class SyncCoordinator with WidgetsBindingObserver {
  final SyncUseCase syncUseCase;
  final SyncStateNotifier notifier;

  bool _isSyncing = false;

  SyncCoordinator(this.syncUseCase, this.notifier);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    AppLogger.d("AppLifecycleState:: $state");
    if (state == AppLifecycleState.resumed && !_isSyncing) {
      _isSyncing = true;
      notifier.syncing();
      try {
        await syncUseCase();
        notifier.done();
      } catch (_) {
        notifier.error();
      } finally {
        _isSyncing = false;
      }
    }
  }
}

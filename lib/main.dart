import 'dart:io';

import 'package:dummy_project/presentation/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/sync_coordinator.dart';
import 'app/sync_state_notifier.dart';
import 'core/app_logger.dart';
import 'di/di.dart';
import 'domain/usecase/sync_usecase.dart';
import 'l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  SyncCoordinator? _syncCoordinator;

  @override
  void initState() {
    super.initState();

    if (Platform.isIOS) {
      _syncCoordinator = SyncCoordinator(
        getIt<SyncUseCase>(),
        getIt<SyncStateNotifier>(),
      );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        WidgetsBinding.instance.addObserver(_syncCoordinator!);
        AppLogger.d('SyncCoordinator registered');
      });
    }
  }

  @override
  void dispose() {
    if (Platform.isIOS && _syncCoordinator != null) {
      WidgetsBinding.instance.removeObserver(_syncCoordinator!);
      AppLogger.d('SyncCoordinator removed');
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('en'), Locale('id')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: router,
    );
  }
}

package com.gayuh.movies

import com.gayuh.movies.core.workmanager.MovieSyncEventChannel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            MovieSyncEventChannel.CHANNEL
        ).setStreamHandler(object : EventChannel.StreamHandler {

            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                MovieSyncEventChannel.eventSink = events
            }

            override fun onCancel(arguments: Any?) {
                MovieSyncEventChannel.eventSink = null
            }
        })
    }
}

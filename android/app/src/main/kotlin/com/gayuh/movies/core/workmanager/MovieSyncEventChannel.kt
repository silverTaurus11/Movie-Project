package com.gayuh.movies.core.workmanager

import io.flutter.plugin.common.EventChannel

object MovieSyncEventChannel {
    const val CHANNEL = "movie_sync/events"
    var eventSink: EventChannel.EventSink? = null

    fun notifyFirstSyncDone() {
        eventSink?.success("first_sync_done")
    }
}

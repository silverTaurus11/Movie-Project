import Flutter

final class SyncEventEmitter {
  static let shared = SyncEventEmitter()
  var sink: FlutterEventSink?

  func notifyFirstSyncDone() {
    DispatchQueue.main.async {
      self.sink?("first_sync_done")
    }
  }
}

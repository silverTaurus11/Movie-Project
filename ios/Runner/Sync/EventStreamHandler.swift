import Flutter

final class EventStreamHandler: NSObject, FlutterStreamHandler {

  static let shared = EventStreamHandler()

  private var eventSink: FlutterEventSink?

  // Called when Flutter starts listening
  func onListen(
    withArguments arguments: Any?,
    eventSink events: @escaping FlutterEventSink
  ) -> FlutterError? {
    self.eventSink = events
    return nil
  }

  // Called when Flutter stops listening
  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    self.eventSink = nil
    return nil
  }

  // Native → Flutter signal
  func notifySyncCompleted() {
    DispatchQueue.main.async {
      self.eventSink?("first_sync_done")
    }
  }
}

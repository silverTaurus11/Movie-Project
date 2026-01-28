import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      NSLog("🔥 AppDelegate launched")
      GeneratedPluginRegistrant.register(with: self)
      let controller = window?.rootViewController as! FlutterViewController

      let channel = FlutterEventChannel(
        name: "movie_sync/events",
        binaryMessenger: controller.binaryMessenger
      )
      channel.setStreamHandler(EventStreamHandler.shared)

      SyncBootstrap.startIfNeeded()
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

}

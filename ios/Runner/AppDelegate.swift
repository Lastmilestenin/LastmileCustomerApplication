import UIKit
import Flutter
import GoogleMaps
import GooglePlaces
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate { 
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyDPnwRkWGUajxdbUd20L8r3r9E2NwXNtxA")
    GMSPlacesClient.provideAPIKey("AIzaSyDPnwRkWGUajxdbUd20L8r3r9E2NwXNtxA")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

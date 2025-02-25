import UIKit
import Flutter
import Foundation


import ARKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let lidarChannel = FlutterMethodChannel(name: "lidar_scan",
                                              binaryMessenger: controller.binaryMessenger)

    // Make sure LidarScanner is accessible
    let scanner = LidarScanner()

    lidarChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "startScan" {
        let scanData = scanner.startScanning()
        result(scanData)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
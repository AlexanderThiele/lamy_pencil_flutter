import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      /*
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let channel = FlutterMethodChannel(name: "dev.thiele/lamy2",
                                         binaryMessenger: controller.binaryMessenger)
      
      
      channel.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
          
          switch(call.method){
          case "connect": self?.connect(result: result);
          }
      })*/
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
}

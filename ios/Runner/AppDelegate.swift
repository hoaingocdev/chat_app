import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "chat.service.channel", binaryMessenger: controller.binaryMessenger)
        
        channel.setMethodCallHandler({
            (call: FlutterMethodCall, result:  FlutterResult) -> Void in
            guard call.method == "receiveMsg" else {
                result(FlutterMethodNotImplemented)
                return
            }
            self.receiveMsg(arg: call.arguments ,result: result)
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func receiveMsg(arg: Any?,  result: FlutterResult){
        guard let args = arg as? [String : Any] else {return}
        let msg = args["msg"] as! String
        let rs = "Reply from iOS native for message: \(msg)"
        result(rs)
    }
    
}

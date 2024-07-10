import Flutter
import UIKit

public class LamyPencilFlutterPlugin: NSObject, FlutterPlugin {
    private var lamyConnectionChannel: FlutterMethodChannel?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "dev.thiele/lamy", binaryMessenger: registrar.messenger())
        
        let instance = LamyPencilFlutterPlugin()
        
        instance.initialize(channel: channel)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    
    public func initialize(channel: FlutterMethodChannel){
        self.lamyConnectionChannel = channel
        
        NotificationCenter.default.addObserver(self, selector: #selector(connectionChanged), name: Notification.Name(LamyStylusManagerDidChangeConnectionStatus), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(button1Down), name: Notification.Name(LamyStylusButton1Down), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(button1Up), name: Notification.Name(LamyStylusButton1Up), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(button2Down), name: Notification.Name(LamyStylusButton2Down), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(button2Up), name: Notification.Name(LamyStylusButton2Up), object: nil)
    }
    
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        switch(call.method){
        case "isConnected": self.isConnected(result: result);
        case "isEnabled": self.isEnabled(result: result);
        case "getBattery": self.getBattery(result: result);
        case "enable": self.enable(result: result);
        case "disable": self.disable(result: result);
        case "connect": self.connect(result: result);
        case "disconnect": self.disconnect(result: result);
        default: result(FlutterMethodNotImplemented);
        }
    }
    
    private func isConnected(result:FlutterResult){
        print("3");
        result(Bool(LamyStylusManager.sharedInstance().isStylusConnected))
    }
    
    private func isEnabled(result:FlutterResult){
        result(Bool(LamyStylusManager.sharedInstance().isEnabled))
    }
    
    private func getBattery(result:FlutterResult){
        result(Int(LamyStylusManager.sharedInstance().batteryLevel))
    }
    
    private func enable(result:FlutterResult){
        LamyStylusManager.sharedInstance().enable();
        result(Bool(true))
    }
    
    private func disable(result:FlutterResult){
        LamyStylusManager.sharedInstance().disable();
        result(Bool(true))
    }
    
    private func connect(result:FlutterResult) {
        /*LamyStylusManager.sharedInstance().startDiscoveryAndImmediatelyConnect(true, withDiscoveryBlock: {string in print(string ?? "")}, completionBlock: {string,arg  in print(string)
            print(arg ?? "qwe")
        })*/
        LamyStylusManager.sharedInstance().startDiscovery(completionBlock: {string,arg  in print(string)
            print(arg ?? "qwe")
        })
        
        result(Bool(true))
    }
    
    private func disconnect(result:FlutterResult) {
        LamyStylusManager.sharedInstance().disconnectStylus()
        result(Bool(true))
    }
    
    @objc private func connectionChanged(note: NSNotification) {
        guard let status = note.userInfo?[LamyStylusManagerDidChangeConnectionStatusStatusKey] else {
            return
        }
        if status as! UInt  == LamyConnectionStatus.connected.rawValue {
            if (lamyConnectionChannel != nil) {
                lamyConnectionChannel!.invokeMethod("lamyConnection", arguments: "connected")
            }
        } else if status as! UInt  == LamyConnectionStatus.scanning.rawValue {
            if (lamyConnectionChannel != nil) {
                lamyConnectionChannel!.invokeMethod("lamyConnection", arguments: "scanning")
            }
        } else if status as! UInt  == LamyConnectionStatus.off.rawValue {
            if (lamyConnectionChannel != nil) {
                lamyConnectionChannel!.invokeMethod("lamyConnection", arguments: "off")
            }
        } else if status as! UInt  == LamyConnectionStatus.pairing.rawValue {
            if (lamyConnectionChannel != nil) {
                lamyConnectionChannel!.invokeMethod("lamyConnection", arguments: "pairing")
            }
        } else if status as! UInt  == LamyConnectionStatus.powerOff.rawValue {
            if (lamyConnectionChannel != nil) {
                lamyConnectionChannel!.invokeMethod("lamyConnection", arguments: "powerOff")
            }
        } else if status as! UInt  == LamyConnectionStatus.disconnected.rawValue {
            if (lamyConnectionChannel != nil) {
                lamyConnectionChannel!.invokeMethod("lamyConnection", arguments: "disconnected")
            }
        } else if status as! UInt  == LamyConnectionStatus.stylusNotSupportThePlatform.rawValue {
            if (lamyConnectionChannel != nil) {
                lamyConnectionChannel!.invokeMethod("lamyConnection", arguments: "notSupported")
            }
        } else if status as! UInt  == LamyConnectionStatus.swapStylusNotSupportThePlatform.rawValue {
            if (lamyConnectionChannel != nil) {
                lamyConnectionChannel!.invokeMethod("lamyConnection", arguments: "notSupported")
            }
        }
    }
    
    @objc func button1Down() {
        lamyConnectionChannel!.invokeMethod("button1", arguments: "down")
    }
    
    @objc func button1Up() {
        lamyConnectionChannel!.invokeMethod("button1", arguments: "up")
    }
    
    @objc func button2Down() {
        lamyConnectionChannel!.invokeMethod("button2", arguments: "down")
    }
    
    @objc func button2Up() {
        lamyConnectionChannel!.invokeMethod("button2", arguments: "up")
    }
}

//
//  ViewController.swift
//  Security App
//
//  Created by Emily on 11/8/16.
//  Copyright © 2016 emilyosowski. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, IBEPushReceiver {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
    var backendless = Backendless.sharedInstance()
    
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            }
        }
        else {
            let settings = UIUserNotificationSettings(types:[.alert, .sound, .badge], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
        }
        
        backendless!.messaging.registerDevice(withChannels: ["testing"])
        backendless!.messaging.pushReceiver = self
        

//        subscribe()
//        
//        publishAsync()
        
    }
    
 
    
//    func publishAsync() {
//        
//        let message = "Message \(self.i+=1)"
//        backendless?.messaging.publish(
//            "default", message:message,
//            response: { ( messageStatus) -> () in
//                print("Message published (ASYNC) -  \(messageStatus!.messageId)")
//        },
//            error: { ( fault : Fault?) -> () in
//                print("Server reported an error (ASYNC): \(fault)")
//        }
//        )
//    }
//    
//    func subscribe() {
//        
//        backendless?.messaging.subscribe(
//            "default",
//            subscriptionResponse: { ( messages) -> () in
//                
//                for message in (messages as [Message]!) {
//                    print("Received message - \(message.data)")
//                }
//        },
//            subscriptionError: { ( fault : Fault?) -> () in
//                print("Server reported an error (FAULT): \(fault)")
//        },
//            response: { (response) -> () in
//                print("subscribe -  \(response)")
//        },
//            error: { (fault : Fault?) -> () in
//                print("Server reported an error (SUBSCRIPTION ERROR): \(fault)")
//        }
//        )
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func publish() {
        
        print("TEXT IS PUBLISHED")
        
        
        let publishHeaders = [
            "publisher_name":"Tester",
            "ios-badge":"1",
            "ios-sound":"default",
            "android-content-text":"Content text",
            "android-content-title":"Title",
            "android-ticker-text":"Ticker text"
            ] as [String : Any]
        
        let publishOptions = PublishOptions()
        publishOptions.assignHeaders(publishHeaders)
        
        let deliveryOptions = DeliveryOptions()
        deliveryOptions.pushPolicy(PUSH_ONLY)
        deliveryOptions.pushBroadcast(FOR_ANDROID.rawValue|FOR_IOS.rawValue)
        //deliveryOptions.addSinglecast("AC1B6B88-9061-4BDA-81E9-BBAAA735369C")
        
        backendless!.messaging.publish(
            "testing",
            message: "Hello, 😄😀😊😈😧", //"ONE",
            publishOptions: publishOptions,
            deliveryOptions: deliveryOptions,
            response: {(status: MessageStatus?) -> () in
                print("Message has been sent: \(status)")
        },
            error: { (fault : Fault?) -> () in
                print("Server reported an error: \(fault)")
        })
    }
    
    
    // -------------------------------------------------------------------------------------------
    
    
    // IBEPushReceiver Methods
    
    public func didReceiveRemoteNotification(_ notification: String!, headers: [AnyHashable : Any]!) {
        print("RECEIVED MESSAGE: \(headers["publisher_name"]) -> \(notification)")
    }
    
    public func didRegisterForRemoteNotifications(withDeviceId deviceId: String!, fault: Fault!) {
        
        if fault == nil {
            print("didRegisterForRemoteNotificationsWithDeviceId: \(deviceId)")
            
            publish()
        }
        else {
            print("didRegisterForRemoteNotificationsWithDeviceId: \(fault)")
        }
    }
    
    public func didFailToRegisterForRemoteNotificationsWithError(_ err: Error!) {
        print("didFailToRegisterForRemoteNotificationsWithError: \(err)")
    }
    

}


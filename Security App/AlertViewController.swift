//
//  AlertViewController.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 1/24/17.
//  Copyright © 2017 emilyosowski. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    
    var backendless = Backendless.sharedInstance()
    
    var i = 0
    
    @IBOutlet weak var alertLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        publish()
        subscribe()
        
        publishAsync()
    }
    
    func publishSync() {
        
        Types.tryblock({ () -> Void in
            
            let message = "Message \(self.i+=1)"
            let messageStatus = self.backendless?.messaging.publish("default", message:message)
            print("Message published (SYNC) - \(messageStatus?.messageId)")
        },
                       
                       catchblock: { (exception) -> Void in
                        print("Server reported an error (SYNC): \(exception as! Fault)")
        }
        )
    }
    
    func publishAsync() {
        
        let message = "Message \(self.i+=1)"
        backendless?.messaging.publish(
            "default", message:message,
            response: { ( messageStatus) -> () in
                print("Message published (ASYNC) -  \(messageStatus!.messageId)")
        },
            error: { ( fault : Fault?) -> () in
                print("Server reported an error (ASYNC): \(fault)")
        }
        )
    }
    
//    func publish() {
//        
//        if self.i > 0 {
//            publishSync()
//        }
//        
//        let interval = dispatch_time(dispatch_time_t(DispatchTime.now()), Int64(500 * Double(NSEC_PER_MSEC)))
//        dispatch_after(interval, dispatch_get_global_queue(DispatchQueue.GlobalQueuePriority.default, 0)) {
//            self.publish()
//        }
//        
//    }
    
    func subscribe() {
        
        backendless?.messaging.subscribe(
            "default",
            subscriptionResponse: { ( messages) -> () in
                
                for message in messages as [Message]! {
                    print("Received message - \(message.data)")
                    self.alertLabel.text = "\(message.data)"
                }
        },
            subscriptionError: { ( fault : Fault?) -> () in
                print("Server reported an error (FAULT): \(fault)")
        },
            response: { (response) -> () in
                print("subscribe -  \(response)")
        },
            error: { (fault : Fault?) -> () in
                print("Server reported an error (SUBSCRIPTION ERROR): \(fault)")
        }
        )
    }
    
    
}


//
//  AlertViewController.swift
//  Security App
//
//  Created by Osowski, Emily, Vodafone Americas on 1/24/17.
//  Copyright © 2017 emilyosowski. All rights reserved.
//


import UIKit

class AlertViewController: UIViewController{
    
    /* - production (UserServiceOperation)
     let APP_ID = "1A9E560D-E6EE-DEF9-FF2C-2565B567E800"
     let SECRET_KEY = "2146BA33-CA63-EBC6-FFE4-1EAC4E0CD400"
     */
    // - production (BEFeatureDay)
    
    let APP_ID = "D55FE643-9856-08BB-FFC4-163728F3F400"
    let SECRET_KEY = "1302ECDA-6678-F016-FF86-D01C9E33EC00"
    let VERSION_NUM = "v1"

    
    var backendless = Backendless.sharedInstance()
    
    
//    @IBOutlet weak var AlertLabel: UILabel!
    
    @IBOutlet weak var alertOneDate: UILabel!
    
    @IBOutlet weak var alertOneTitle: UILabel!
    
    @IBOutlet weak var alertOneBody: UILabel!
    
    
    @IBOutlet weak var alertTwoDate: UILabel!
    
    @IBOutlet weak var alertTwoTitle: UILabel!
    
    @IBOutlet weak var alertTwoBody: UILabel!
    
//    @IBOutlet weak var AlertBody: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("self.ofClass = \(Types.insideTypeClassName(self.ofClass()))")
        
        backendless?.initApp(APP_ID, secret:SECRET_KEY, version:VERSION_NUM)
        backendless?.hostURL = "http://api.backendless.com"
        
        fetchingFirstPage()
        fetchingFirstPageAsync()
        
        
        //fetchingFirstPageMenuItems()
    }
    
    func fetchingFirstPage() {
        
        print("\n============ Fetching first page using the SYNC API ============")
        
        let startTime = NSDate()
        
        Types.tryblock({ () -> Void in
            
            let query = BackendlessDataQuery()
            let alerts = (self.backendless?.persistenceService.of(Alert.ofClass()).find(query))! as BackendlessCollection
            
            let currentPage = alerts.getCurrentPage()
            print("Loaded \(currentPage?.count) restaurant objects:")
            print("Total restaurants in the Backendless starage - \(alerts.totalObjects)")
            for alert in currentPage as! [Alert] {
                print("Restaurant <\(alert.ofClass())> name = \(alert.AlertTitle), cuisine = \(alert.AlertBody)")
                self.alertOneDate.text = alert.AlertDate! as String
                self.alertOneTitle.text = alert.AlertTitle! as String
                self.alertOneBody.text = alert.AlertBody! as String
//                self.alertTwoDate.text = alert.created! as String
//                self.alertTwoTitle.text = alert.AlertTitle! as String
//                self.alertTwoBody.text = alert.AlertBody! as String
            }
        },
                       catchblock: { (exception) -> Void in
                        print("Server reported an error: \(exception as! Fault)")
        },
                       
                       finally: {() -> Void in
                        print("Total time (ms) - \(1000*NSDate().timeIntervalSince(startTime as Date))")
        }
        )
    }
    
    func fetchingFirstPageAsync() {
        
        print("\n============ Fetching first page using the ASYNC API ============")
        
        let startTime = NSDate()
        
        let query = BackendlessDataQuery()
        backendless?.persistenceService.of(Alert.ofClass()).find(
            query,
            response: { ( alerts : BackendlessCollection?) -> () in
                let currentPage = alerts?.getCurrentPage()
                print("Loaded \(currentPage?.count) restaurant objects")
                print("Total restaurants in the Backendless starage - \(alerts?.totalObjects)")
                
                for alert in currentPage as! [Alert] {
                    print("Restaurant name = \(alert.AlertTitle)")
                }
                
                print("Total time (ms) - \(1000*NSDate().timeIntervalSince(startTime as Date))")
        },
            error: { ( fault : Fault?) -> () in
                print("Server reported an error: \(fault)")
        }
        )
}
}








//import UIKit
//
//class AlertViewController: UIViewController {
//    
//    
//    var backendless = Backendless.sharedInstance()
//    
//    var i = 0
//    
//    @IBOutlet weak var alertLabel: UILabel!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        
////        publish()
//        subscribe()
//        
//        publishAsync()
//    }
//    
//    func publishSync() {
//        
//        Types.tryblock({ () -> Void in
//            
//            let message = "Message \(self.i+=1)"
//            let messageStatus = self.backendless?.messaging.publish("default", message:message)
//            print("Message published (SYNC) - \(messageStatus?.messageId)")
//        },
//                       
//                       catchblock: { (exception) -> Void in
//                        print("Server reported an error (SYNC): \(exception as! Fault)")
//        }
//        )
//    }
//    
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
////    func publish() {
////        
////        if self.i > 0 {
////            publishSync()
////        }
////        
////        let interval = dispatch_time(dispatch_time_t(DispatchTime.now()), Int64(500 * Double(NSEC_PER_MSEC)))
////        dispatch_after(interval, dispatch_get_global_queue(DispatchQueue.GlobalQueuePriority.default, 0)) {
////            self.publish()
////        }
////        
////    }
//    
//    func subscribe() {
//        
//        backendless?.messaging.subscribe(
//            "default",
//            subscriptionResponse: { ( messages) -> () in
//                
//                for message in messages as [Message]! {
//                    print("Received message - \(message.data)")
//                    self.alertLabel.text = "\(message.data)"
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
//    
//    
//}


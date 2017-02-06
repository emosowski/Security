//
//  AppDelegate.swift
//  Security App
//
//  Created by Emily on 11/8/16.
//  Copyright © 2016 emilyosowski. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // BEVideoChat
    let APP_ID = "D55FE643-9856-08BB-FFC4-163728F3F400"
    let SECRET_KEY = "1302ECDA-6678-F016-FF86-D01C9E33EC00"
    let VERSION_NUM = "v1"
    
    var backendless = Backendless.sharedInstance()
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UINavigationBar.appearance().backgroundColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.black
        DebLog.setIsActive(true)
        
        
        backendless!.initApp(APP_ID, secret:SECRET_KEY, version:VERSION_NUM)
        //backendless!.hostURL = "http://api.backendless.com"
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        backendless!.messaging.applicationWillTerminate()
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        backendless!.messaging.didRegisterForRemoteNotifications(withDeviceToken: deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        backendless!.messaging.didFailToRegisterForRemoteNotificationsWithError(error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        backendless!.messaging.didReceiveRemoteNotification(userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        print("didReceiveRemoteNotification userInfo: \(userInfo)")
        
        backendless!.messaging.didReceiveRemoteNotification(userInfo)
        completionHandler(.newData)
    }
    
    
}

@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    @objc(userNotificationCenter:willPresentNotification:withCompletionHandler:)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void) {
        
        let userInfo = notification.request.content.userInfo
        print(">>>>>>>>>>>>> userNotificationCenter -> willPresent notification: userInfo = \(userInfo)")
        
        backendless!.messaging.didReceiveRemoteNotification(userInfo)
    }
}

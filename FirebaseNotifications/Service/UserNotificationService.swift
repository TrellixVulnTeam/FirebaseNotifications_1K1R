//
//  UserNotificationService.swift
//  FirebaseNotifications
//
//  Created by Kenton D. Raiford on 1/15/18.
//  Copyright © 2018 Kenton D. Raiford. All rights reserved.
//

import UIKit
import UserNotifications

class UserNotificationService: NSObject
{
    private override init() {}
    
    static let shared = UserNotificationService()
    let unCenter = UNUserNotificationCenter.current()
    
    //request auth to send notifications
    func authorize()
    {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        unCenter.requestAuthorization(options: options)
        { (granted, error) in
            print(error ?? "No un authorization error")
            guard granted else {return}
            DispatchQueue.main.async
                {
                    self.configure()
                }
        }
    }
    
    func configure()
    {
        unCenter.delegate = self
        
        let application = UIApplication.shared
        application.registerForRemoteNotifications()
    }
}

extension UserNotificationService: UNUserNotificationCenterDelegate
{
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("un did receive")
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        print("un will present")
        
        let options: UNNotificationPresentationOptions = [.alert, .sound]
        completionHandler(options)
    }
}

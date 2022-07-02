//
//  ViewController.swift
//  LocalNotification
//
//  Created by Al-Amin on 2/7/22.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Local Notification"
        showNotification()
    }
    
    fileprivate func showNotification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound,.badge]) { granted, error in
            guard let error = error else {
                print(error)
                return
            }
        }
        
        let content = UNMutableNotificationContent.init()
        content.title = "Hi, It's a notification!"
        content.body = "watch me!"
        
        let date = Date().addingTimeInterval(10)
        let dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: dateComponents, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) { error in
            
        }
    }
}

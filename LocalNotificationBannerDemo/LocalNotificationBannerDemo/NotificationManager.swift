//
//  NotificationManager.swift
//  LocalNotificationBannerDemo
//
//  Created by iAskedYou2nd on 12/28/22.
//

import Foundation
import UserNotifications

class NotificationManager: ObservableObject {
    
    @Published var showBanner = false
    private var timer: Timer?
    @Published var banner = BannerData(title: "This is a test", detail: "To see what will occur")
    
    func requestAuthLocalNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { isSuccess, error in
            if isSuccess {
                print("Successfully registered")
            } else {
                print("Failed to register for reason: \(String(describing: error))")
            }
        }
    }
    
    func sendLocalNotifications() {
        
        let content = UNMutableNotificationContent()
        content.title = "This is a test"
        content.subtitle = "To see how this might work"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        
        let id = UUID()
        let request = UNNotificationRequest(identifier: id.uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    
    func startBannerPresentation() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { _ in
            self.showBanner = true
        })
    }
    
    
}


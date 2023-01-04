//
//  ContentView.swift
//  LocalNotificationBannerDemo
//
//  Created by iAskedYou2nd on 12/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var notificationManager: NotificationManager = NotificationManager()
    
//    @State var banner: BannerData = BannerData(title: "This is a test", detail: "To see what will occur")
    
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                notificationManager.requestAuthLocalNotifications()
            } label: {
                Text("Request Auth")
            }
            Spacer()
            Button {
                notificationManager.sendLocalNotifications()
            } label: {
                Text("Start")
            }
            Spacer()
            
            Button {
                self.notificationManager.startBannerPresentation()
            } label: {
                Text("Internal Banner")
            }
            
        }
        .padding()
        .banner(data: self.$notificationManager.banner, show: self.$notificationManager.showBanner)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

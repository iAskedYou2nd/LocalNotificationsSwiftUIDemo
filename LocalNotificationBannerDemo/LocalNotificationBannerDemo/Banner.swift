//
//  Banner.swift
//  LocalNotificationBannerDemo
//
//  Created by iAskedYou2nd on 12/28/22.
//

import SwiftUI

struct BannerData {
    var title: String
    var detail: String
}

struct BannerModifier: ViewModifier {
    
    @Binding var data: BannerData
    @Binding var show: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(data.title).bold()
                            Text(data.detail).font(Font.system(size: 15, weight: .light, design: .default))
                        }
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding(12)
                    .background(.blue)
                    .cornerRadius(8)
                    Spacer()
                }
                .padding()
                .animation(.easeInOut)
                .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                .onTapGesture {
                    withAnimation {
                        self.show = false
                    }
                }.onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.show = false
                        }
                    }
                }
            }
        }
    }
}

extension View {
    func banner(data: Binding<BannerData>, show: Binding<Bool>) -> some View {
        self.modifier(BannerModifier(data: data, show: show))
    }
}

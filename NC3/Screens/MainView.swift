//
//  MainView.swift
//  NC3
//
//  Created by Leonardo Marhan on 17/07/24.
//

import SwiftUI

struct MainView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem {
                    Label("Activities", systemImage: "figure.walk")
                }
            
            CalenderView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                } 
            BookmarkScreenView()
                .tabItem {
                    Label("Bookmark", systemImage: "bookmark")
                }
        }
        .tint(Color.orange)
    }
}

#Preview {
    MainView()
}

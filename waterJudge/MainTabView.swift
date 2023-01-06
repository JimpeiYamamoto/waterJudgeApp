//
//  ContentView.swift
//  waterJudge
//
//  Created by 水代謝システム工学研究室 on 2022/12/29.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("ホーム")
                }
            
            TimelineView()
                .tabItem {
                    Image(systemName: "text.line.first.and.arrowtriangle.forward")
                    Text("タイムライン")
                }
            
            
            VoteView()
                .tabItem {
                    Image(systemName: "highlighter")
                    Text("投票")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

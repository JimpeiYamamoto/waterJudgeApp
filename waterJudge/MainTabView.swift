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
            
            TopView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Top")
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

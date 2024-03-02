//
//  MainView.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @State private var selection: String = "Game"
    @Query private var treasuresList: [Treasure]
   
    var body: some View {
        TabView(selection: $selection,
                content:  {
            GameView().tabItem { Text("Game") }.tag(1) // when you click the Game you go to GameView
            SettingsView().tabItem { Text("Settings") }.tag(2)
        })
       
    }
}

#Preview {
    MainActor.assumeIsolated{MainView().modelContainer(for: Treasure.self)}
}

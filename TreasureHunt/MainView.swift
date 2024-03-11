//
//  MainView.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import SwiftUI
import SwiftData

// The main ui component that will load the other component views based on what tab is clicked.
struct MainView: View {
    @State private var selection: String = "Game"
    @Query private var treasuresList: [Treasure]
    @State private var treasureName: String = "cat"
    @State private var treasureAmount: Int = 1
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        //creating a Tab view that has the Gameview and the SettingsView as opitons
        TabView(selection: $selection,
                content:  {
            GameView().tabItem { Text("Game") }.tag(1) // when you click the Game you go to GameView
            SettingsView(treasureName: $treasureName, treasureAmount: $treasureAmount).tabItem { Text("Settings") }.tag(2)
        })
        
    }
}

#Preview {
    MainActor.assumeIsolated{MainView().modelContainer(for: Treasure.self)} // needed for newer model class to work properly
}

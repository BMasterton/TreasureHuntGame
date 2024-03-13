//
//  TreasureHuntApp.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import SwiftUI
import SwiftData

@main
/// Description: Main app that will load the MainView keeping in mind we are using models so also adding the .modelContainer
struct TreasureHuntApp: App {
    /// Description: The render of the Mainview
    var body: some Scene {
        WindowGroup {
            MainView()
        }.modelContainer(for: Treasure.self) // this allows us to use models properly 
    }
}

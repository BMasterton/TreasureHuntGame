//
//  TreasureHuntApp.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import SwiftUI
import SwiftData

@main
struct TreasureHuntApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }.modelContainer(for: Treasure.self)
    }
}

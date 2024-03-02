//
//  Tile.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import Foundation
import Observation



@Observable class Tile: Identifiable {
    var isRevealed: Bool = false
    var isTreasure: Bool = false
    var xLocation: Int = 0
    var yLocaiton: Int = 0
    var tileName: String = "?"
    var treasure: Treasure = Treasure(treasureName: " ")
    
}

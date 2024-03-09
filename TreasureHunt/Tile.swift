//
//  Tile.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import Foundation
import Observation



@Observable class Tile: Identifiable {
    var isRevealed: Bool = false // is the tile revealed
    var isTreasure: Bool = false // is the tile a treasure
    var xLocation: Int = 0 // x location
    var yLocaiton: Int = 0 // y location
    var tileName: String = "questionmark" // the name of the tile that dicattes what is seen
    var treasure: Treasure? // optional treausre can be added to the tile 
    
    // when we create a tile, we can directly set the x and y locations so we always know where it is
    init(x: Int, y: Int){
        self.xLocation = x
        self.yLocaiton = y
    }
    
    // we send in a treasure that will then be set to a tile
    func placeTreasure(treasure: Treasure){
        self.treasure = treasure
        self.isTreasure = true
    }
    
    // check for the treasure, if treasure is true, as is its not nil then return true, if not there return false
    func hasTreasure() -> Bool {
        return treasure != nil
    }
}

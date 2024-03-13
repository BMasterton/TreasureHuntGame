//
//  Tile.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import Foundation
import Observation



/// Description: A tile is what each space in the board matrix represents, objects filled with data
@Observable class Tile: Identifiable {
    /// Description: is the tile revealed
    var isRevealed: Bool = false
    /// Description: is the tile a treasure
    var isTreasure: Bool = false
    /// Description: The x location in the matrix
    var xLocation: Int = 0
    /// Description: the y location in the matrix
    var yLocation: Int = 0
    /// Description: the name of the tile that dicattes what is seen visually on the board
    var tileName: String = "questionmark"
    /// Description: optional treasure can be added to the tile
    var treasure: Treasure?
    
    
    /// Description: When we create a tile, we can directly set the x and y locations so we always know where it is
    /// - Parameters:
    ///   - x: the x location on the matrix
    ///   - y: the y location on the matrix
    init(x: Int, y: Int){
        self.xLocation = x
        self.yLocation = y
    }
    
    
    /// Description: we send in a treasure that will then be set to a tile. also setting isTreasure to true so we can check against it later
    /// - Parameter treasure: treasure description: The treasure we want to place on this tile
    func placeTreasure(treasure: Treasure){
        self.treasure = treasure
        self.isTreasure = true
    }
    
}

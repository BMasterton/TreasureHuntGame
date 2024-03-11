//
//  Board.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-03-01.
//

import Foundation

//this is where we create a board of Tile objects based on a given size passed in
@Observable class Board: Identifiable {
    
    var size = 5 //size of the board
    
    //making an array of Tiles here
    var tiles: [[Tile]] = [[Tile]]()
    
    //Init for not needing size
    init() {
        for x in 0..<size {
            var row = [Tile]()
            
            for y in 0..<size {
                row.append(Tile(x: x, y: y)) // add tile at certain location
            }
            tiles.append(row)
        }
    }
    
    // Init for when we want a given size based on list
    init(size: Int){
        self.size = size
        for x in 0..<size {
            var row = [Tile]()
            
            for y in 0..<size {
                row.append(Tile(x: x, y: y))
            }
            tiles.append(row)
        }
    }
}

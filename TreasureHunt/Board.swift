//
//  Board.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-03-01.
//

import Foundation


/// Description: this is where we create a board of Tile objects based on a given size passed in
@Observable class Board: Identifiable {
    
    /// Description: size of the board
    var size = 5
    
    
    /// Description: The array of tile objects
    var tiles: [[Tile]] = [[Tile]]()
    
    /// Description: Init for when we want to set the tile locations and we dont have a size, we go over all tile array indexes and add a Tile object to each with location data.
    init() {
        for x in 0..<size {
            var row = [Tile]()
            
            for y in 0..<size {
                row.append(Tile(x: x, y: y)) // add tile at certain location
            }
            tiles.append(row)
        }
    }
    
    
    /// Description: Init for when we want to set the tile locations and we wanta board of a specific size,  we go over all tile array indexes and add a Tile object to each with location data
    /// - Parameter size: size description: The size we want the array to be, so if size is 4, it would be a 4x4 matrix
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

//
//  Board.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-03-01.
//

import Foundation

@Observable class Board: Identifiable {
    let size = 10
    var tiles: [[Tile]] = [[Tile]]()
    init() {
        for x in 0..<size {
            var row = [Tile]()
            
            for y in 0..<size {
                row.append(Tile())
                row[y].xLocation = x
                row[y].yLocaiton = y

            }
            tiles.append(row)
        }
        
        //add treasures and change their values i think 
    }
}

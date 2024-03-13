//
//  Treasure.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import Foundation
import SwiftData


/// Description: A Treasure that is a model class and identifiable for saving information has a name and amount so we can easily keep track of what we have when there are many
@Model class Treasure: Identifiable {
    /// Description: The name of the treasure
    var treasureName: String
    /// Description: The amout of treasures associated with each list item of a treasure
    var treasureAmount: Int
    
    /// Description: init for a treasure so we can set it up properly based on users inputs
    /// - Parameters:
    ///   - treasureName: treasureName description: The name given to a treaure, which is input from the textInput and represents what will show up in the gameview
    ///   - treasureNumber: treasureNumber description: The treasure amount per the list item 
    init(treasureName: String, treasureNumber: Int){
        self.treasureName = treasureName
        self.treasureAmount = treasureNumber
    }
}

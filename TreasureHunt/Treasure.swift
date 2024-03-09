//
//  Treasure.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import Foundation
import SwiftData

//A Treasure that is a model class and identifiable for later has a name and amount so we can easily keep track of what we have when there are many 
@Model class Treasure: Identifiable {
    var treasureName: String
    var treasureAmount: Int
    
    init(treasureName: String, treasureNumber: Int){
        self.treasureName = treasureName
        self.treasureAmount = treasureNumber
    }
}

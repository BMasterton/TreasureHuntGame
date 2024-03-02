//
//  Treasure.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import Foundation
import SwiftData

//To denote what a treasure is i cant currently think of anything other than a name it would need 
@Model class Treasure: Identifiable {
    var treasureName: String
    
    init(treasureName: String){
        self.treasureName = treasureName
    }
}

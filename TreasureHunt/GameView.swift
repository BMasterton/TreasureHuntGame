//
//  GameView.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import SwiftUI

struct GameView: View {
    @State private var board = Board()
    var body: some View {
        VStack{
            ForEach(board.tiles, id:\.first!.id) { row in
                HStack {
                    ForEach(row) { tile in
                        Button(tile.tileName) {
                            //could do something here
                        }
                       
                        
                    }}
                
            }
           Text("Attempts: ")
            //Text("Attempts: \(attempts)")
            Text("Total Remaining: ")
        }
    }
}

#Preview {
    MainView()
}

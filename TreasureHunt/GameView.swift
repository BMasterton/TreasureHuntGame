//
//  GameView.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import SwiftUI
import SwiftData


func getTreasureTotal(treasureList: [Treasure])-> Int{
    var total = 0
    for list in treasureList{
        total = total + list.treasureAmount
    }
    return total
}

// This function is used to place all treasures on the board checking for existing treasures and placing the treasures in concecutive free spaces
func placeTreasures(totalTreasureAmount: Int, board: Board, treasureList: [Treasure]){
    var clearToInput = false
    //for every treasure in our treaures list, so for each row of data basically, if you have a cat treausure and a dog one then it will look through 2 indexes
    for treasure in treasureList{
        //while there isnt a treasure already in a chosen spot
        while clearToInput == false {
            //proably need a while True or something loop here
            let randomXLocation =  Int.random(in: 0..<totalTreasureAmount)
            let randomYLocation = Int.random(in: 0..<totalTreasureAmount)
            let randomDirection = Int.random(in: 0...1)
            
            // 0 will be horizontal
            if randomDirection == 0 {
                //look through all hypothetical random spots and if they are all free then procceed elsewise try again with new random coordinates
                for x in 0..<treasure.treasureAmount {
                    //if theres already a treasure there dont add a treasure
                    if board.tiles[(randomXLocation + x) % totalTreasureAmount][randomYLocation].isTreasure {
                        //try another spot by breaking out of the loop
                        break
                    }
                }
                // you found no treasures so you can input values below
                clearToInput = true
                // For each spot previewed add the treasure
                for x in 0..<treasure.treasureAmount {
                    board.tiles[(randomXLocation + x) % totalTreasureAmount][randomYLocation].placeTreasure(treasure: treasure)
                }
            }
            //if not horizontal its now vertical and repeat the same checks as shows above
            else {
                for y in 0..<treasure.treasureAmount {
                    if board.tiles[randomXLocation][(randomYLocation + y) % totalTreasureAmount].isTreasure {
                        //return false
                      break
                    }
                    
                }
                clearToInput = true
                for y in 0..<treasure.treasureAmount {
                    board.tiles[randomXLocation][(randomYLocation + y) % totalTreasureAmount].placeTreasure(treasure: treasure)
                }
            }
            // we have placed an entire row of treasure now we can let it know we are not clear and to find new values and break out fo the loop
            clearToInput = false
            break
        }
    }
}

// This is the the ui that shows the game, the matrix that holds all the hidden treasures 
struct GameView: View {
    @State private var totalTaps: Int = 0 // total amount of taps a player makes
    @State private var totalRemaining: Int = 0 // how many treausures are left over
    @State private var totalTreasureAmount = 0 // Total amount of treasues over all lists
    @Query var treasuresList: [Treasure] // the actual list of treasures
    @Environment(\.modelContext) private var modelContext // the model which saves our treasures list
    @State private var board = Board() // The board

    
    
    var body: some View {
        VStack{
            //looping through all tiles setting ids, and then creating buttons for each tile
            ForEach(board.tiles, id:\.first!.id) { row in
                HStack {
                    ForEach(row) { tile in
                        Button {
                            //is there is an unrevealed treasure
                            if tile.isTreasure && !tile.isRevealed{
                                tile.tileName = tile.treasure!.treasureName // set the tile to the treasure now thats its revealed
                                tile.isRevealed = true
                                totalTaps += 1 // add to taps
                                totalRemaining -= 1 // remove from remaining
                            }
                            // just so you cant keep clicking on the revealed treasure tiles and add to taps
                            else if tile.isTreasure && tile.isRevealed{
                                tile.tileName = tile.treasure!.treasureName
                            } 
                            //so you cant keep clicking on reveled non treasure tiles
                            else if tile.tileName == "circle" && tile.isRevealed {
                                tile.tileName = "circle"
                            }
                            // add taps to unknown non treasues and set its name
                            else {
                                tile.tileName = "circle"
                                tile.isRevealed = true
                                totalTaps += 1
                            }
                        } label: {
                            Image(systemName: tile.tileName)
                        }
                        
                    }.padding()
                }//.padding()
            }
            Text("Attempts: \(totalTaps)")
            // if total taps remaining is 0 show game over else show whats left
            Text(totalRemaining == 0 ? "Game Over" : "Total Remaining: \(totalRemaining)")
            //this is a vstack function that will happen AFTER initialization and will run these functions or set variables below so that it will actually change as changes are made to the board and allow us to place treasures 
        }.onAppear{totalTreasureAmount = getTreasureTotal(treasureList: treasuresList) 
            board = Board(size: totalTreasureAmount)
            placeTreasures(totalTreasureAmount: totalTreasureAmount, board: board, treasureList: treasuresList)
            totalRemaining = totalTreasureAmount
            totalTaps = 0 // when you go back to settings and the matrix changes we want the taps to reset
        }.padding()
    }
}

#Preview {
    MainView()
}

//
//  SettingsView.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import SwiftUI
import SwiftData

// this is the view of all the treasures list, the actual list that leads to what is added to the matrix 
struct SettingsView: View {
    
    @Query var treasuresList: [Treasure] // actual list of treasures
    @Binding var treasureName: String
    @Binding var treasureAmount: Int
    @Environment(\.modelContext) private var modelContext
    let range = 1...1000000000
    let step = 1
    
    var body: some View {
        NavigationStack() {
            VStack {
                //making list where each part of the list has an editable Textfield, a stepper and a text to show the steppers value
                List{
                    ForEach(treasuresList){
                        treasure in @Bindable var treasure = treasure
                        HStack{
                            TextField(
                                "Item",
                                text: Binding(
                                    get: {
                                        treasure.treasureName
                                    },
                                    set: {
                                        newValue in
                                        treasure.treasureName = newValue.lowercased() // making sure its all the same case as sysimages need lowercase most of the time
                                    }
                                )
                            )
                            Stepper(
                                value: $treasure.treasureAmount,
                                in: range,
                                step: step
                            ){
                                Text(String(treasure.treasureAmount)).accessibilityIdentifier("SettingsCountText")
                            }
                        }}.onDelete { //grabbing the index we are currently on from the first argument so we can know what to propely delete from the model with reference from the treasures list
                            if let index = $0.first {
                                //
                                let item = treasuresList[index]
                                modelContext.delete(item) // deleting here
                            }
                            }
                }
            }.navigationBarTitle(Text("Treasures")).toolbar{ // the title of the nav bar, the large TREASURE text
                ToolbarItemGroup{ // adding buttons to the tool bar on the settings page
                    EditButton() // regular edit button that we give information above
                    //plus button for adding to the modelContext 
                    Button(action: {
                        withAnimation {
                            let item = Treasure(treasureName: treasureName, treasureNumber: treasureAmount)
                            modelContext.insert(item) //
                        }
                    }, label: {Image(systemName: "plus")}).accessibilityIdentifier("PlusButton")
                }
            }
        }
    }
}

#Preview {
    MainView()
}

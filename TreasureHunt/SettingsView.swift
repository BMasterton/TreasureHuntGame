//
//  SettingsView.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-02-26.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        NavigationStack() {
            VStack {
                
                
            }.navigationBarTitle(Text("Treasures")).toolbar{
                ToolbarItemGroup{
                    
                    Button(action: {
                        //add what button does here
                    }, label: {Text("Edit")}).accessibilityIdentifier("EditButton")
                    Button(action: {
                        //add action here
                    }, label: {Image(systemName: "plus")}).accessibilityIdentifier("PlusButton")
                }
            }
        }
        
    }
}

#Preview {
    MainView()
}

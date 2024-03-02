//
//  TextStepper.swift
//  TreasureHunt
//
//  Created by IMD 224 on 2024-03-01.
//

import SwiftUI

struct TextStepper: View {
    @State private var count = 0
    @State private var text = "cat"
    let range = 1...1000000000
    let step = 1
    var body: some View {
        HStack{
            TextEditor(text: Binding(
                get: {
                    text
                    
                },
                set: {
                    newValue in
                        text = newValue
                }
            )) // need to make it smaller 
           
            Stepper(
                value: Binding(
                    get: {
                        count
                        
                    },
                    set: {
                        newValue in
                       count = newValue
                        
                    }
                ),
                in: range,
                step: step
            ){
                Text(String(count)).accessibilityIdentifier("SettingsCountText")
            }
        }
    }
}

#Preview {
    TextStepper()
}

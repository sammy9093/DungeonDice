//
//  ContentView.swift
//  DungeonDice
//
//  Created by Sammy on 1/18/23.
//DROP LAST is a method of an enum

import SwiftUI

struct ContentView: View {
    
    enum Dice: Int, CaseIterable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    
    @State private var resultMessage = ""
    @State private var buttonsLeftOver = 0 //Number of buttons left over first row
    let horizontalPadding: CGFloat = 16
    let spacing: CGFloat = 0 //between buttons
    let buttonWidth: CGFloat = 130
    var body: some View {
        GeometryReader { geo in
            VStack {
                TitleView()
                
                Spacer()
                
                Text(resultMessage)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .frame(height: 150)
                
                Spacer()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: buttonWidth), spacing: spacing)]) {
                    ForEach(Dice.allCases.dropLast(buttonsLeftOver), id: \.self) { dice in
                        Button("\(dice.rawValue)-sided") {
                            resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                        }
                        .frame(width: buttonWidth)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)

                }
                HStack {
                    ForEach(Dice.allCases.suffix(buttonsLeftOver), id: \.self) { dice in
                        Button("\(dice.rawValue)-sided") {
                            resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                        }
                        .frame(width: buttonWidth)
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                
                
                }
            .padding()
            .onChange(of: geo.size.width, perform: { newValue in
                arrangeGridItems(deviceWidth: geo.size.width) //Type geo is being passed variable geo
            })
            .onAppear {
                arrangeGridItems(deviceWidth: geo.size.width)
            }
        }
        
    }
    
    func arrangeGridItems(deviceWidth: CGFloat) {
        var screenWidth = deviceWidth - horizontalPadding*2 // paddin on both sides
        if Dice.allCases.count > 1 {
            screenWidth += spacing
        }
        
        //calculate numOfButtonsPerRow as an Int //Could drop decimal
        let numberOfButtonsPerRow = Int(screenWidth) / Int(buttonWidth + spacing)
        buttonsLeftOver = Dice.allCases.count % numberOfButtonsPerRow
        print("numberOfButtonsPerRow = \(numberOfButtonsPerRow) buttonsLeftOver = \(buttonsLeftOver)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



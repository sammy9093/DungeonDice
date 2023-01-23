//
//  TitleView.swift
//  DungeonDice
//
//  Created by Sammy on 1/22/23.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Dungeon Dice!")
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(.red)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}

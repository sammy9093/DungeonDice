//
//  DetailView.swift
//  DungeonDice
//
//  Created by Sammy on 1/22/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss //\/dismiss is the cool thing but the var is adjustable
    var passedValue: String
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundColor(.orange)
            Text("NewView!\n And you passed over the value \(passedValue)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Spacer()
            Button("Get Back!") {
                dismiss() //specially treat like a function, replaces function
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        //.navigationBarBackButtonHidden()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(passedValue: "Item 1") //Only needed as example view
    }
}

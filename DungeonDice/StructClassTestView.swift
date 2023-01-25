//
//  StructClassTestView.swift
//  DungeonDice
//
//  Created by Sammy on 1/24/23.
// MVVM - Model, View, ViewModel. An architecture style... hot topic.
// Decopiling data
// Model: define the structure, or provide the "blueprint" of our data. Models are typically created using structs.
// View: the elements that define the SwiftUI user interface. Views==structs as defined by Swift
// ViewModel: coordination logic between model & view, these are where classes reside.

// Unit testing. A way to debunk code by abstraction

import SwiftUI

//struct ToDo {
//    var item = ""
//    var completed = false
//}

struct StructClassTestView: View {
    @State private var toDo = ToDo() // Cannot use state variables with reference types like classes in Swuift UI. TBH: CHANGE keyword in class, identically same setup, even instantiation??.
    
    var body: some View {
        VStack {
            Text("The To Do item is: \(toDo.item)")
            
            TextField("enter To Do here", text: $toDo.item)
                .font(.largeTitle)
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct StructClassTestView_Previews: PreviewProvider {
    static var previews: some View {
        StructClassTestView()
    }
}

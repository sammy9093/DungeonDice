//
//  DungeonDiceApp.swift
//  DungeonDice
//
//  Created by Sammy on 1/18/23.
//

import SwiftUI

@main
struct DungeonDiceApp: App {
    @StateObject var toDosVM = ToDosViewModel() //Use the class
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)  //First view of windows group, it's the (P) in autocomplete
            //ContentView()
        }
    }
}

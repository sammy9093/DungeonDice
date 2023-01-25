//
//  ToDosViewModel.swift
//  DungeonDice
//
//  Created by Sammy on 1/24/23.
//

import Foundation

class ToDosViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []

    init() {
        // Temp date for example
        toDos.append(ToDo(item: "Learn Swift"))
        toDos.append(ToDo(item: "Learn Swift2"))
    }
}


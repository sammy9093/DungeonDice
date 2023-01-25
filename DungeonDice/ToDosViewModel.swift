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
    
    func saveToDo(toDo: ToDo, newToDo: Bool) {
        
            // if new, append to toDoVM.todos else update the toDo that was passed in the from the List.
            if newToDo {
                //toDosVM.
                toDos.append(toDo)
               // **** dismiss() // Need for escape. Not for VM Model
            } else {
                //toDosVM.
                if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                    //toDosVM.
                    toDos[index] = toDo
                    // *** dismiss()
                    // $0.id condenses "{ arrayToDo in arrayToDo.id == toDo.id})"
                    /* When we clicked on the NavigationLink we passed over the ToDo element that we clicked on, and we put it in the DetailView's @State variable named toDo.
                     The element that we clicked on came from the Environment Object toDosVM.toDos array.
                     After we're done editing the toDo item in the DetailView, we want to take what's in this @State variable and add  it to the proper element in the toDosVM.toDos array of our EnvironmentObject.
                     But how do we find the index of the toDosVM.toDos array that matches the index of toDo?
                     We can use the unique id propert that we added to each ToDo struct.
                     We'll use an array function called findIndex to find the index in toDosVM that matches the index of the @State variable toDo.
                     Once we have this index, we can use it to update the proper element in toDosVM.toDos.
                     */
                }
            }
        
    }
}


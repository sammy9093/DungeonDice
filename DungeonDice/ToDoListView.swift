//
//  ToDoListView.swift
//  DungeonDice
//
//  Created by Sammy on 1/22/23.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    @EnvironmentObject var toDosVM: ToDosViewModel
//    var toDos = ["Learn Switft", "Build Apss", "World Piece", "Vacation"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDosVM.toDos) { toDo in //\.self was bad, identifiable protocol. Every iteteration of the toDos arrau thats insidethetoDosVM object.
                    //                    Text(toDo)
                    NavigationLink {
                        DetailView(toDo: toDo) // State struct value on our toDo.
                        
//                        DetailView(passedValue: toDo) // not applicapile, not accessing with past values. Rather we use a state wide environment pointer.
                    } label: {
                        Text(toDo.item) // added .item due to 
                    }
                    .font(.title2)
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    //                    NavigationLink {
                    //                        DetailView(passedValue: "")
                    //                    } label: {
                    //                        Image(systemName: "plus")
                    //                    }
                }
                //.padding()
            }
            //MARK: This is to present the view in a pulled up 'NewItem' action
            .sheet(isPresented: $sheetIsPresented) {
                //                DetailView(passedValue: "")
                //            }
                //            .fullScreenCover(isPresented: $sheetIsPresented) {
                NavigationStack {
                    //DetailView(passedValue: "")
                    DetailView(toDo: ToDo(), newToDo: true)
                    //newToDo changes state  in DetailView triggering an append.
                    /////New value needed. Needed to be the function of.
                    //Loads ToDo state variable, with a new toDO with all default values
                }
            }
        }
    }
    struct ToDoListView_Previews: PreviewProvider {
        static var previews: some View {
            ToDoListView()
                .environmentObject(ToDosViewModel()) //Added passthrough function
        }
    }
}

//            VStack {
//                NavigationLink {
//                    DetailView()
//                } label: {
//                    Image(systemName: "eye")
//                    Text("Show the New view")
//                }
//                .buttonStyle(.borderedProminent)
//            }
//                Section {
//                    NavigationLink {
//                        DetailView()
//                    } label: {
//                        Text("Winter")
//                    }
//                    Text("Summer")
//                } header: {
//                    Text("Semesters")
//                }
//
//                Section {
//                    Text("Fall")
//                    Text("Fall")
//                } header: {
//                    Text("Breaks")
//                }
//                ForEach(1..<100, id: \.self) { number in
//                    NavigationLink {
//                        DetailView(passedValue: "Item \(number)")
//                    } label: {
//                        Text("Item \(number)")
//                    }
//                }


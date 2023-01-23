//
//  ToDoListView.swift
//  DungeonDice
//
//  Created by Sammy on 1/22/23.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = ["Learn Switft", "Build Apss", "World Piece", "Vacation"]
    var body: some View {
        NavigationStack {
            //            VStack {
            //                NavigationLink {
            //                    DetailView()
            //                } label: {
            //                    Image(systemName: "eye")
            //                    Text("Show the New view")
            //                }
            //                .buttonStyle(.borderedProminent)
            //            }
            List {
                ForEach(toDos, id: \.self) { toDo in
//                    Text(toDo)
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }
                }
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
                ForEach(1..<100, id: \.self) { number in
                    NavigationLink {
                        DetailView(passedValue: "Item \(number)")
                    } label: {
                        Text("Item \(number)")
                    }

                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
        
        
        .padding()
    }
    
}


struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}



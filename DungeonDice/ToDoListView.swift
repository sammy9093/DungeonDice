//
//  ToDoListView.swift
//  DungeonDice
//
//  Created by Sammy on 1/22/23.
//

import SwiftUI

struct ToDoListView: View {
   @State private var sheetIsPresented = false
    
    var toDos = ["Learn Switft", "Build Apss", "World Piece", "Vacation"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    //                    Text(toDo)
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
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
//            .sheet(isPresented: $sheetIsPresented) {
//                DetailView(passedValue: "")
//            }
            .fullScreenCover(isPresented: $sheetIsPresented) {
                DetailView(passedValue: "")
            }
        }
    }
    struct ToDoListView_Previews: PreviewProvider {
        static var previews: some View {
            ToDoListView()
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


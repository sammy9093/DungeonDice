//
//  DetailView.swift
//  DungeonDice
//
//  Created by Sammy on 1/22/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss //\/dismiss is the cool thing but the var is adjustable
    @State private var toDo = ""
    @State private var reminderIsOn = false
    @State private var dueDate = Date.now + (60*60*24)
    @State private var notes = ""
    @State private var isCompleted = false
    var passedValue: String
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Enter To Do here", text: $toDo)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                //Spacer()
                
                Toggle("Set Reminder", isOn: $reminderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                DatePicker("Date", selection: $dueDate)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                    .disabled(!reminderIsOn)
                Text("Notes:")
                    .padding(.top)
                TextField("Notes", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                Toggle("Completed", isOn: $isCompleted)
                    .padding(.top)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss() //remeber parent
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                         //TOD: remeber parent
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
        //        VStack {
        //            Image(systemName: "swift")
        //                .resizable()
        //                .scaledToFit()
        //                .foregroundColor(.orange)
        //            Text("NewView!\n And you passed over the value \(passedValue)")
        //                .font(.largeTitle)
        //                .multilineTextAlignment(.center)
        //            Spacer()
        //            Button("Get Back!") {
        //                dismiss() //specially treat like a function, replaces function
        //            }
        //            .buttonStyle(.borderedProminent)
        //        }
        //        .padding()
//        .navigationBarBackButtonHidden()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(passedValue: "Item 1") //Only needed as example view
    }
}

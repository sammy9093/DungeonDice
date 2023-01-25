//
//  DetailView.swift
//  DungeonDice
//
//  Created by Sammy on 1/22/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss //\/dismiss is the cool thing but the var is adjustable
    @EnvironmentObject var toDosVM: ToDosViewModel //don't litterally initilize class
    @State var toDo: ToDo //Struct on this screen, not initilized due to where it comes from (last page)
    var newToDo = false
    
    var body: some View {
        List {
            TextField("Enter To Do here", text: $toDo.item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            //Spacer()
            
            Toggle("Set Reminder", isOn: $toDo.reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            DatePicker("Date", selection: $toDo.dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!toDo.reminderIsOn)
            Text("Notes:")
                .padding(.top)
            TextField("Notes", text: $toDo.notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            Toggle("Completed", isOn: $toDo.isCompleted)
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
                    toDosVM.saveToDo(toDo: toDo, newToDo: newToDo)
                    dismiss()
                }
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
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
    
    struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            
            NavigationStack {
                DetailView(toDo: ToDo()) //Only needed as example view
                    .environmentObject(ToDosViewModel())
            }
        }
    }
}


// Calling methods to the view model.

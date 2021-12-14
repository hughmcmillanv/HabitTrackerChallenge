//
//  AddView.swift
//  HabitTrackerChallenge
//
//  Created by Hugh McMillan V on 12/1/21.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    @State private var timesCompleted: Int? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Habit", text: $name)
                    } header: {
                        Text("Activity Name")
                    }
                    Section {
                        TextEditor(text: $description)
                    } header: {
                        Text("Activity Description")
                    }
                    Section {
                        TextField("Number", value: $timesCompleted, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Number of Times Completed")
                    }
                }
                .navigationTitle("Add activity")
                .toolbar {
                    Button("Save") {
                        let activityToSave = ActivityItem(name: name, description: description, timesCompleted: timesCompleted ?? 1)
                        activities.activitiesList.append(activityToSave)
                        dismiss()
                    }
                    .disabled(name.isEmpty || description.isEmpty || timesCompleted == nil)
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var activities = Activities()
    
    static var previews: some View {
        AddView(activities: activities)
    }
}


//
//  ContentView.swift
//  HabitTrackerChallenge
//
//  Created by Hugh McMillan V on 12/1/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.activitiesList) { activity in
                    NavigationLink(destination: ActivityView(activities: activities, activity: activity)) {
                        HStack {
                            Text(activity.name)
                                .font(.headline)
                            Spacer()
                            Section {
                                activity.timesCompleted == 1 ?
                                Text("Completed \(activity.timesCompleted) time") :
                                Text("Completed \(activity.timesCompleted) times")
                            }
                            .font(.subheadline)
                            .padding(5)
                            .frame(minWidth: 50)
                            .background(color(for: activity))
                            .clipShape(Capsule())
                        }
                    }
                }
                .onDelete(perform: removeActivities)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        showingAddActivity.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddView(activities: activities)
            }
        }
    }
    
    func removeActivities(at offsets: IndexSet) {
        activities.activitiesList.remove(atOffsets: offsets)
    }
    
    func color(for activity: ActivityItem) -> Color {
        if activity.timesCompleted < 5 {
            return .red
        } else if activity.timesCompleted < 25 {
            return .yellow
        } else if activity.timesCompleted < 50 {
            return .green
        } else {
            return .blue
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ActivityView.swift
//  HabitTrackerChallenge
//
//  Created by Hugh McMillan V on 12/1/21.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var activities: Activities
    var activity: ActivityItem
    
    var body: some View {
        List {
            Section {
                Text(activity.description)
            } header: {
                Text("Description")
            }
            Section {
                Text("\(activity.timesCompleted)")
            } header: {
                Text("Number of Times Completed")
            }
            Button("Mark Completed") {
                var newActivity = activity
                newActivity.timesCompleted += 1
                
                if let index = activities.activitiesList.firstIndex(of: activity) {
                    activities.activitiesList[index] = newActivity
                }
            }
        }
        .navigationTitle(Text(activity.name))
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activities: Activities(), activity: ActivityItem.exampleActivity)
    }
}

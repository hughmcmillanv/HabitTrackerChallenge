//
//  Activities.swift
//  HabitTrackerChallenge
//
//  Created by Hugh McMillan V on 12/1/21.
//

import Foundation

class Activities: ObservableObject, Identifiable {
    @Published var activitiesList = [ActivityItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activitiesList) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedActivities = try? JSONDecoder().decode([ActivityItem].self, from: savedActivities) {
                activitiesList = decodedActivities
                return
            }
        }
        activitiesList = []
    }
}

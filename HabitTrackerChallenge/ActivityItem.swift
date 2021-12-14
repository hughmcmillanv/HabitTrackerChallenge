//
//  ActivityItem.swift
//  HabitTrackerChallenge
//
//  Created by Hugh McMillan V on 12/1/21.
//

import Foundation

struct ActivityItem: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var timesCompleted = 0
    
    static let exampleActivity = ActivityItem(name: "Example", description: "This is an example activity.")
}

//
//  TaskItem.swift
//  QuickTasks Watch App
//
//  Created by Janith Kavinda on 2026-10-09.
//

import Foundation

struct TaskItem: Identifiable {

    let id = UUID()

    var title: String
    var completed: Bool
}

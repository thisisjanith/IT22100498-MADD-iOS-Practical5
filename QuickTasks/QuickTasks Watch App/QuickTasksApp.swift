//
//  QuickTasksApp.swift
//  QuickTasks Watch App
//
//  Created by Janith Kavinda on 2026-10-09.
//

import SwiftUI

@main
struct QuickTasks_Watch_AppApp: App {
    @State private var sampleDetailTask = TaskItem(
        title: "Morning Walk",
        completed: true,
        category: .health,
        priority: .medium
    )

    var body: some Scene {
        WindowGroup {
            if CommandLine.arguments.contains("-screenshotDetail") {
                NavigationStack {
                    TaskDetailView(task: $sampleDetailTask)
                }
            } else {
                ContentView()
            }
        }
    }
}

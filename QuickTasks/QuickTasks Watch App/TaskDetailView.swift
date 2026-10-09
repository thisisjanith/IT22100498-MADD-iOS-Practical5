//
//  TaskDetailView.swift
//  QuickTasks Watch App
//
//  Created by Janith Kavinda on 2026-10-09.
//

import SwiftUI

struct TaskDetailView: View {

    let task: TaskItem

    var body: some View {

        VStack(spacing: 10) {

            Image(
                systemName:
                    task.completed
                    ? "checkmark.circle.fill"
                    : "circle"
            )
            .font(.largeTitle)
            .foregroundStyle(task.completed ? .green : .secondary)

            Text(task.title)
                .font(.headline)
                .multilineTextAlignment(.center)

            Text(
                task.completed
                ? "Completed"
                : "Pending"
            )
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .navigationTitle("Details")
    }
}

#Preview {
    TaskDetailView(task: TaskItem(title: "Sample Task", completed: false))
}

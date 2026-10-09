//
//  TaskDetailView.swift
//  QuickTasks Watch App
//
//  Created by Janith Kavinda on 2026-10-09.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var task: TaskItem

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                // Task Status Symbol
                Image(
                    systemName: task.completed
                        ? "checkmark.circle.fill"
                        : "circle"
                )
                .font(.system(size: 40))
                .foregroundStyle(task.completed ? .green : .secondary)

                // Task Title
                Text(task.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 4)

                // Task Status
                Text(task.completed ? "Completed" : "Pending")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(task.completed ? .green : .orange)

                Divider()
                    .padding(.vertical, 2)

                // Metadata: Category & Priority
                VStack(spacing: 6) {
                    HStack {
                        Label(task.category.rawValue, systemImage: task.category.icon)
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }

                    HStack {
                        HStack(spacing: 4) {
                            Image(systemName: task.priority.icon)
                            Text("\(task.priority.rawValue) Priority")
                        }
                        .font(.caption2)
                        .foregroundStyle(task.priority.color)
                        Spacer()
                    }
                }
                .padding(.horizontal, 8)

                Divider()
                    .padding(.vertical, 2)

                // Toggle Button
                Button {
                    task.completed.toggle()
                } label: {
                    Label(
                        task.completed ? "Mark as Pending" : "Mark as Completed",
                        systemImage: task.completed ? "arrow.uturn.backward" : "checkmark"
                    )
                }
                .tint(task.completed ? .orange : .green)
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Details")
    }
}

#Preview {
    TaskDetailView(
        task: .constant(
            TaskItem(
                title: "Morning Walk",
                completed: true,
                category: .health,
                priority: .medium
            )
        )
    )
}

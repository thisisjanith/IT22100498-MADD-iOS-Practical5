//
//  ContentView.swift
//  QuickTasks Watch App
//
//  Created by Janith Kavinda on 2026-10-09.
//

import SwiftUI

struct ContentView: View {

    @State private var tasks: [TaskItem] = {
        if CommandLine.arguments.contains("-screenshotCompleted") {
            return [
                TaskItem(
                    title: "Morning Walk",
                    completed: true,
                    category: .health,
                    priority: .medium
                ),
                TaskItem(
                    title: "Drink Water",
                    completed: true,
                    category: .health,
                    priority: .high
                ),
                TaskItem(
                    title: "Read Notes",
                    completed: true,
                    category: .study,
                    priority: .low
                ),
                TaskItem(
                    title: "Call Home",
                    completed: true,
                    category: .personal,
                    priority: .high
                )
            ]
        }
        return [
            TaskItem(
                title: "Morning Walk",
                completed: true,
                category: .health,
                priority: .medium
            ),
            TaskItem(
                title: "Drink Water",
                completed: false,
                category: .health,
                priority: .high
            ),
            TaskItem(
                title: "Read Notes",
                completed: false,
                category: .study,
                priority: .low
            ),
            TaskItem(
                title: "Call Home",
                completed: true,
                category: .personal,
                priority: .high
            )
        ]
    }()

    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    private var progressPercentage: Int {
        tasks.isEmpty ? 0 : Int((Double(completedCount) / Double(tasks.count)) * 100)
    }

    var body: some View {
        NavigationStack {
            List {
                // Header / Progress Section
                Section {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(completedCount) / \(tasks.count) Completed")
                            .font(.headline)

                        Text("\(progressPercentage)% Complete")
                            .font(.caption2)
                            .foregroundStyle(.secondary)

                        ProgressView(value: Double(completedCount), total: Double(tasks.count))
                            .tint(.green)
                    }
                    .padding(.vertical, 2)
                }

                // Tasks Section
                Section("Tasks") {
                    ForEach(tasks.indices, id: \.self) { index in
                        Button {
                            tasks[index].completed.toggle()
                        } label: {
                            HStack(spacing: 8) {
                                Image(
                                    systemName: tasks[index].completed
                                        ? "checkmark.circle.fill"
                                        : "circle"
                                )
                                .font(.title3)
                                .foregroundStyle(tasks[index].completed ? .green : .secondary)

                                Text(tasks[index].title)
                                    .strikethrough(tasks[index].completed)

                                Spacer()
                            }
                        }
                    }
                }

                // Details Navigation Section
                Section("Details") {
                    ForEach(tasks.indices, id: \.self) { index in
                        NavigationLink {
                            TaskDetailView(task: $tasks[index])
                        } label: {
                            HStack {
                                Image(systemName: tasks[index].category.icon)
                                    .foregroundStyle(.tint)
                                Text(tasks[index].title)
                                    .font(.caption)
                            }
                        }
                    }
                }

                // Actions Section (Reset All Tasks)
                Section {
                    Button(role: .destructive) {
                        for index in tasks.indices {
                            tasks[index].completed = false
                        }
                    } label: {
                        Label("Reset Tasks", systemImage: "arrow.counterclockwise")
                    }
                }
            }
            .navigationTitle("Quick Tasks")
        }
    }
}

#Preview {
    ContentView()
}

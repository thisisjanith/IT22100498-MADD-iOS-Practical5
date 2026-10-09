//
//  ContentView.swift
//  QuickTasks Watch App
//
//  Created by Janith Kavinda on 2026-10-09.
//

import SwiftUI

struct ContentView: View {

    @State private var tasks = [
        TaskItem(
            title: "Morning Walk",
            completed: true
        ),
        TaskItem(
            title: "Drink Water",
            completed: false
        ),
        TaskItem(
            title: "Read Notes",
            completed: false
        )
    ]

    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    var body: some View {
        NavigationStack {
            VStack {
                Text("\(completedCount)/\(tasks.count) Completed")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                List(tasks.indices, id: \.self) { index in
                    HStack {
                        Button {
                            tasks[index].completed.toggle()
                        } label: {
                            Image(
                                systemName: tasks[index].completed
                                    ? "checkmark.circle.fill"
                                    : "circle"
                            )
                            .foregroundStyle(tasks[index].completed ? .green : .secondary)
                        }
                        .buttonStyle(.plain)

                        NavigationLink {
                            TaskDetailView(task: tasks[index])
                        } label: {
                            Text(tasks[index].title)
                        }
                    }
                }
            }
            .navigationTitle("Tasks")
        }
    }
}

#Preview {
    ContentView()
}

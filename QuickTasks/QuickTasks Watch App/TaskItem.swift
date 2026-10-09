//
//  TaskItem.swift
//  QuickTasks Watch App
//
//  Created by Janith Kavinda on 2026-10-09.
//

import Foundation
import SwiftUI

enum TaskCategory: String, CaseIterable, Identifiable {
    case health = "Health"
    case study = "Study"
    case personal = "Personal"
    case work = "Work"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .health: return "heart.fill"
        case .study: return "book.fill"
        case .personal: return "person.fill"
        case .work: return "briefcase.fill"
        }
    }
}

enum TaskPriority: String, CaseIterable, Identifiable {
    case low = "Low"
    case medium = "Medium"
    case high = "High"

    var id: String { rawValue }

    var color: Color {
        switch self {
        case .low: return .blue
        case .medium: return .orange
        case .high: return .red
        }
    }

    var icon: String {
        switch self {
        case .low: return "arrow.down"
        case .medium: return "minus"
        case .high: return "exclamationmark"
        }
    }
}

struct TaskItem: Identifiable {
    let id: UUID
    var title: String
    var completed: Bool
    var category: TaskCategory
    var priority: TaskPriority

    init(
        id: UUID = UUID(),
        title: String,
        completed: Bool = false,
        category: TaskCategory = .personal,
        priority: TaskPriority = .medium
    ) {
        self.id = id
        self.title = title
        self.completed = completed
        self.category = category
        self.priority = priority
    }
}

//
//  ContentView.swift
//  QuickTasks Watch App
//
//  Created by Janith Kavinda on 2026-10-09.
//

import SwiftUI

struct ContentView: View {

    @State private var glasses = 0

    var body: some View {

        ScrollView {
            VStack(spacing: 10) {

                Image(systemName: "drop.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)

                Text("Water")
                    .font(.headline)

                Text("\(glasses)")
                    .font(.largeTitle)
                    .bold()

                Text("Glasses")
                    .font(.caption)

                Button {
                    glasses += 1
                } label: {
                    Label(
                        "Add Water",
                        systemImage: "plus.circle.fill"
                    )
                }

                Button {
                    glasses = 0
                } label: {
                    Label(
                        "Reset",
                        systemImage: "arrow.counterclockwise"
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

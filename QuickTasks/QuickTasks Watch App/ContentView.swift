//
//  ContentView.swift
//  QuickTasks Watch App
//
//  Created by Janith Kavinda on 2026-10-09.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        VStack(spacing: 10) {

            Image(systemName: "figure.walk")
                .font(.largeTitle)
                .foregroundStyle(.green)

            Text("Daily Activity")
                .font(.headline)

            Text("5,240")
                .font(.title)
                .bold()

            Text("Steps")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContentView()
}

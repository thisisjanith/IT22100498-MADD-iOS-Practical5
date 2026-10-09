//
//  ContentView.swift
//  QuickTasks Watch App
//
//  Created by Janith Kavinda on 2026-10-09.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        VStack(spacing: 8) {

            Image(systemName: "applewatch")
                .font(.title)

            Text("SE4041")
                .font(.headline)
                .bold()

            Text("watchOS")
                .font(.caption)
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Books-RebaseAndMerge
//
//  Created by João Bruno Rodrigues on 10/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var books: [Book] = []

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Book.self, inMemory: true)
}

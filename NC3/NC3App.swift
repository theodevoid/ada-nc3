//
//  NC3App.swift
//  NC3
//
//  Created by Theodore Mangowal on 11/07/24.
//

import SwiftUI
import SwiftData

@main
struct NC3App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            RecommendedLocation.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
//            ContentView()
//            DetailScreenView()// -> to test add to calendar
            MainView()
        }
        .modelContainer(sharedModelContainer)
//        .modelContainer(sharedModelContainer)
    }
}

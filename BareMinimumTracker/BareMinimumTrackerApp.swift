//
//  BareMinimumTrackerApp.swift
//  BareMinimumTracker
//
//  Created by Rohit R. Mohanty on 26/08/2024.
//

import SwiftUI
import SwiftData

@main
struct BareMinimumTrackerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([User.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            LoginView() // Set LoginView as the initial view
        }
        .modelContainer(sharedModelContainer)
    }
}

//
//  Odessey_of_LifeApp.swift
//  Odessey-of-Life
//
//  Created by Roshan Ekka on 25/03/24.
//

import SwiftUI
import SwiftData

@main
struct Odessey_of_LifeApp: App {

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    let container: ModelContainer = {
        let schema = Schema([journalDataModel.self])
//        let configuration = ModelConfiguration
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
    
        }
        .modelContainer(container)
//        .modelContainer(for: journalDataModel.self)
   
    }
}

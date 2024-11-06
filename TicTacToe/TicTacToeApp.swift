//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Camilo Medina on 6/11/24.
//

import SwiftUI
import SwiftData

@main
struct TicTacToeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            GameStateEntity.self,
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
            TicTacToeView(viewModel: GameViewModel(repository: GameRepositoryImpl(modelContainer: sharedModelContainer)))
        }
        .modelContainer(sharedModelContainer)
    }
}

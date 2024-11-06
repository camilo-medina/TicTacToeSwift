//
//  GameRepositoryImpl.swift
//  TicTacToe
//
//  Created by Camilo Medina on 6/11/24.
//

import Foundation
import SwiftData

class GameRepositoryImpl: GameRepository {
    private let modelContainer: ModelContainer
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }
    
    func saveGameState(_ state: GameModel) async throws {
        let context = ModelContext(modelContainer)
        
        let entity = GameStateEntity(
            board: state.board.map { $0.map { cell in
                switch cell {
                case .empty:
                    return ""
                case .occupied(let player):
                    return player == .X ? "X" : "O"
                }
            }},
            currentPlayer: state.currentPlayer == .X ? "X" : "O",
            isGameOver: state.isGameOver
        )
        
        context.insert(entity)
        
        try context.save()
    }
    
    func loadGameState() async throws -> GameModel? {
        let context = ModelContext(modelContainer)
        
        let descriptor = FetchDescriptor<GameStateEntity>()
        let entities = try context.fetch(descriptor)
        
        guard let entity = entities.first else { return nil }
        
        let board: [[CellState]] = entity.board.map { $0.map { cell in
            switch cell {
            case "X":
                return .occupied(.X)
            case "O":
                return .occupied(.O)
            default:
                return .empty
            }
        }}
        let currentPlayer: Player = entity.currentPlayer == "X" ? .X : .O
        return GameModel(board: board, currentPlayer: currentPlayer, isGameOver: entity.isGameOver)
    }
}

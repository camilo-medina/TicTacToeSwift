//
//  GameRepositoryPreview.swift
//  TicTacToe
//
//  Created by Camilo Medina on 6/11/24.
//

class GameRepositoryPreview: GameRepository {
    func saveGameState(_ state: GameModel) async throws {
    }
    
    func loadGameState() async throws -> GameModel? {
        return nil
    }
}

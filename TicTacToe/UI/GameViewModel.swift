//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Camilo Medina on 6/11/24.
//

import Foundation
import Combine
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var gameModel: GameModel
    @Published var winner: Winner?
    private var gameLogic: GameLogic
    private var repository: GameRepository
    
    init(repository: GameRepository) {
        let gameModel = GameModel()
        self.repository = repository
        self.gameModel = gameModel
        self.gameLogic = GameLogic(model: gameModel)
    }
    
    func playerMove(row: Int, col: Int) {
        let success = gameLogic.makeMove(row: row, col: col)
        if success {
            withAnimation {
                gameModel = gameLogic.model
            }
            
            if gameModel.isGameOver {
                winner = Winner(name: gameModel.currentPlayer == .X ? "Player 1" : "Player 2")
            }
            
            Task {
                try? await repository.saveGameState(gameModel)
            }
        }
    }
    
    func resetGame() {
        gameModel = GameModel()
        gameLogic.model = gameModel
        winner = nil
    }
    
    func loadGame() async {
        if let state = try? await repository.loadGameState() {
            DispatchQueue.main.async {
                self.gameModel = state
            }
        }
    }
}


extension GameViewModel {
    static var preview: GameViewModel {
        let viewModel = GameViewModel(repository: GameRepositoryPreview())
        viewModel.gameModel = GameModel(
            board: [
                [.occupied(.X), .empty, .occupied(.O)],
                [.occupied(.O), .occupied(.X), .empty],
                [.empty, .occupied(.O), .occupied(.X)]
            ],
            currentPlayer: .X,
            isGameOver: false
        )
        return viewModel
    }
}

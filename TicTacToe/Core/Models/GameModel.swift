//
//  GameModel.swift
//  TicTacToe
//
//  Created by Camilo Medina on 6/11/24.
//

import Foundation

enum Player {
    case X, O
}

enum CellState: Equatable {
    case empty, occupied(Player)
}

struct GameModel {
    var board: [[CellState]]
    var currentPlayer: Player
    var isGameOver: Bool
    
    init(board: [[CellState]], currentPlayer: Player, isGameOver: Bool) {
        self.board = board
        self.currentPlayer = currentPlayer
        self.isGameOver = isGameOver
    }
    
    init() {
        board = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
        currentPlayer = .X
        isGameOver = false
    }
}

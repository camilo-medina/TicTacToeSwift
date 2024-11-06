//
//  GameStateEntity.swift
//  TicTacToe
//
//  Created by Camilo Medina on 6/11/24.
//

import Foundation
import SwiftData

@Model
final class GameStateEntity {
    @Attribute(.unique)
    var id: UUID
    var board: [[String]]
    var currentPlayer: String
    var isGameOver: Bool
    
    init(board: [[String]], currentPlayer: String, isGameOver: Bool) {
        self.id = UUID()
        self.board = board
        self.currentPlayer = currentPlayer
        self.isGameOver = isGameOver
    }
}

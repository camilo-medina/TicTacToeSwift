//
//  GameLogic.swift
//  TicTacToe
//
//  Created by Camilo Medina on 6/11/24.
//

import Foundation

class GameLogic {
    var model: GameModel
    
    init(model: GameModel) {
        self.model = model
    }
    
    func makeMove(row: Int, col: Int) -> Bool {
        guard !model.isGameOver, model.board[row][col] == .empty else { return false }
        
        model.board[row][col] = .occupied(model.currentPlayer)
        if checkWin(for: model.currentPlayer) {
            model.isGameOver = true
        } else {
            model.currentPlayer = model.currentPlayer == .X ? .O : .X
        }
        
        return true
    }
    
    private func checkWin(for player: Player) -> Bool {
        // Verificar si el jugador ha ganado en alguna fila
        for row in 0..<3 {
            if model.board[row][0] == .occupied(player) &&
                model.board[row][1] == .occupied(player) &&
                model.board[row][2] == .occupied(player) {
                return true
            }
        }
        
        // Verificar si el jugador ha ganado en alguna columna
        for col in 0..<3 {
            if model.board[0][col] == .occupied(player) &&
                model.board[1][col] == .occupied(player) &&
                model.board[2][col] == .occupied(player) {
                return true
            }
        }
        
        // Verificar si el jugador ha ganado en la diagonal principal
        if model.board[0][0] == .occupied(player) &&
            model.board[1][1] == .occupied(player) &&
            model.board[2][2] == .occupied(player) {
            return true
        }
        
        // Verificar si el jugador ha ganado en la diagonal secundaria
        if model.board[0][2] == .occupied(player) &&
            model.board[1][1] == .occupied(player) &&
            model.board[2][0] == .occupied(player) {
            return true
        }
        
        // Si no se cumple ninguna condición de victoria, devolver false
        return false
    }
}

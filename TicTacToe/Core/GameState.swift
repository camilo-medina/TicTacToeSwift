//
//  GameState.swift
//  TicTacToe
//
//  Created by Camilo Medina on 6/11/24.
//

import Foundation

struct GameState {
    var isGameWon: Bool
    var winner: Player?
    var moves: Int
    
    init() {
        isGameWon = false
        winner = nil
        moves = 0
    }
}

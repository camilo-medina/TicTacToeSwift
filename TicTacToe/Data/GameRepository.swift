//
//  GameRepository.swift
//  TicTacToe
//
//  Created by Camilo Medina on 6/11/24.
//

import Foundation
import SwiftData

protocol GameRepository {
    func saveGameState(_ state: GameModel) async throws
    func loadGameState() async throws -> GameModel?
}

//
//  TicTacToeView.swift
//  TicTacToe
//
//  Created by Camilo Medina on 6/11/24.
//

import SwiftUI

struct TicTacToeView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            ForEach(0..<3, id: \.self) { row in
                HStack {
                    ForEach(0..<3, id: \.self) { col in
                        CellView(state: viewModel.gameModel.board[row][col])
                            .onTapGesture {
                                viewModel.playerMove(row: row, col: col)
                            }
                    }
                }
            }
        }
        .alert(item: $viewModel.winner) { winner in
            Alert(
                title: Text("Game Over"),
                message: Text("\(winner.name) wins!"),
                dismissButton: .default(Text("Play Again")) {
                    viewModel.resetGame()
                }
            )
        }
    }
}

#Preview {
    TicTacToeView(viewModel: .preview)
}

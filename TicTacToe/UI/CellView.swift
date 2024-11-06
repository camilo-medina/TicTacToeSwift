//
//  CellView.swift
//  TicTacToe
//
//  Created by Camilo Medina on 6/11/24.
//

import SwiftUI

struct CellView: View {
    let state: CellState
    
    var body: some View {
        ZStack {
            Rectangle()
                .strokeBorder(Color.black, lineWidth: 1)
                .background(Color.white)
                .frame(width: 80, height: 80)
            
            if case let .occupied(player) = state {
                Text(player == .X ? "X" : "O")
                    .foregroundStyle(player == .X ? .red : .black)
                    .font(.largeTitle)
                    .transition(.scale)
            }
        }
        .animation(.easeInOut, value: state)
    }
}

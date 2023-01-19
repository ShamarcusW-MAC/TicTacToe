//
//  ViewModel.swift
//  TicTacFinger
//
//  Created by Consultant on 1/11/23.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    static func preview() -> ViewModel {
        return ViewModel()
    }
        
        
    @Published var game = Game()
    var layout = Layout()
        
    func clickTileIntent(index: Int) -> Bool {
        game.clickTile(at: index)
    }
    
    var currentPlayer: GamePlayer { game.currentPlayer }
    var winsX: Int { game.winsX }
    var winsO: Int { game.winsO }
    
    var gameResult: String {
        if game.winner == .x {
            return "X wins!"
        } else if game.winner == .o {
            return "O wins!"
        } else {
            return "Cat's Game!"
        }
    }
    
    func resetGameIntent () {
        game.reset()
    }
}

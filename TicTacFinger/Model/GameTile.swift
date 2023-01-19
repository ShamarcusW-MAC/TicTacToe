//
//  GameTile.swift
//  TicTacFinger
//
//  Created by Consultant on 1/11/23.
//

import Foundation

struct GameTile {
    
    static func preview() -> GameTile {
        GameTile(index: 0)
    }
    
    var player = GamePlayer.x
    var index = 0
    var isFaceDown = true
    var isWinner = false
}

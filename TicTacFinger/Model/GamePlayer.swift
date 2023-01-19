//
//  GamePlayer.swift
//  TicTacFinger
//
//  Created by Consultant on 1/11/23.
//

import Foundation

enum GamePlayer {
    case x
    case o
}

extension GamePlayer {
    static var symbolNameX = "xmark"
    static var symbolName0 = "circle"
    static var symbolNameQuestionMark = "questionmark.square.fill"
    
    var symbolName: String {
        switch self {
        case .x:
            return GamePlayer.symbolNameX
        case .o:
            return Self.symbolName0
        }
    }

}

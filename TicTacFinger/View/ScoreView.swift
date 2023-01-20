//
//  ScoreView.swift
//  TicTacFinger
//
//  Created by Sha'Marcus Walker on 1/13/23.
//

import SwiftUI

struct ScoreView: View {
    
    let currentPlayer: GamePlayer
    let winsX: Int
    let winsO: Int
    let landscape: Bool
    
    
    var body: some View {
        VStack {
            
            HStack {
                scoreBox(player: .x, wins: winsX)
                Spacer()
                
                VStack(spacing: 4.0) {
                    Text("Move")
                        .font(.system(size: Device.isIpad ? 38.0 : 24.0).bold())
                        .padding(.top, 4.0)
                    
                    ZStack {
                        Image(systemName: currentPlayer.symbolName)
                            .font(.system(size: symbolSize() * 0.666))
                    }
                    .frame(width: symbolSize(),
                    height: symbolSize())
                }
                .foregroundColor(.white)
                
                Spacer()
                scoreBox(player: .o, wins: winsO)
            }

            blackLine()
        }
        .background(Color.gray)
    }
    
    
    func symbolSize() -> CGFloat {
        if Device.isIpad {
            return 54.0
        } else {
            return landscape ? 30.0 : 44.0
        }
    }
    
    func scoreBox(player: GamePlayer, wins: Int) -> some View {
        ZStack {
            VStack {
                Image(systemName: player.symbolName)
                HStack {
                    Text("W: \(wins)")
                        .font(.system(size: Device.isIpad ? 26.0 : 20.0).bold())
                }
            }
            .padding(.horizontal, 6)
            .padding(.vertical, landscape ? 2.0 : 12.0)
            .foregroundColor(.white)
        }
    }
    
    func blackLine() -> some View {
        HStack {
            Spacer()
        }
        .frame(height: 1.0)
        .background(Color.black)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(currentPlayer: .x, winsX: 4, winsO: 2, landscape: false)
        ScoreView(currentPlayer: .o, winsX: 4, winsO: 2, landscape: false)
        ScoreView(currentPlayer: .x, winsX: 4, winsO: 2, landscape: true)
        ScoreView(currentPlayer: .o, winsX: 4, winsO: 2, landscape: true)
        Spacer()
    }
}

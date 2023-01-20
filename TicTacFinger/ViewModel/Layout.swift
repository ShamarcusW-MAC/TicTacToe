//
//  Layout.swift
//  TicTacFinger
//
//  Created by Sha'Marcus Walker on 1/11/23.
//

import Foundation

struct Layout {
    
    private(set) var boardSeparators = [Separator]()
    private(set) var boardTiles = [Tile]()

    private static let separatorThickness = Device.isIpad ? 10 : 6
    
    struct LayoutItem: Identifiable {
        
        var x: CGFloat
        var y: CGFloat
        var width: CGFloat
        var height: CGFloat
        var id: String {
            let xi = Int(x + 0.5)
            let yi = Int(y + 0.5)
            let widthi = Int(width + 0.5)
            let heighti = Int(height + 0.5)
            return "\(xi)_\(yi)_\(widthi)_\(heighti)"
        }
    }
    
    typealias Separator = LayoutItem
    typealias Tile = LayoutItem
    
    private var _worldWidth: Int = 320
    private var _worldHeight: Int = 320

    private(set) var boardX: Int = 0
    private(set) var boardY: Int = 0
    private(set) var boardWidth: Int = 0
    private(set) var boardHeight: Int = 0
    
    init() {
        self.boardSeparators = [Separator](repeating: Separator(x: 0.0, y:0.0, width: 0.0, height: 0.0), count: 4)
        
        self.boardTiles = [Tile](repeating: Tile(x:0.0, y:0.0, width: 0.0, height: 0.0), count: 9)
    }
    
    mutating func registerGeometry(width: CGFloat, height: CGFloat) -> Bool  {
        let newWidth = Int(width + 0.5)
        let newHeight = Int(height + 0.5)
        
        if ((newWidth != _worldWidth) || (newHeight != _worldHeight)) {
            _worldWidth = newWidth
            _worldHeight = newHeight
            
            if newWidth > newHeight {
                //Landscape orientation
                
                let size = min(_worldHeight - 32, 600)
                
                boardX = _worldWidth / 2 - size / 2
                boardY = _worldHeight / 2 - size / 2
                boardWidth = size
                boardHeight = size

            } else {
                //Portrait orientation
                
                
                let size = min(_worldHeight - 32, 450)
                
                boardX = _worldWidth / 2 - size / 2
                boardY = _worldHeight / 2 - size / 2
                boardWidth = size
                boardHeight = size
                
            }
            
            layoutBoard()

            return true
        }
        
        return false
    }
    
    private mutating func layoutBoard() {
        let separatorVertical_Left_X1 = (boardX + boardWidth / 3) - (Self.separatorThickness / 2)
        let separatorVertical_Left_X2  = separatorVertical_Left_X1 + Self.separatorThickness
        
        
        let separatorVertical_Right_X1  = (boardX + (boardWidth * 2) / 3) - (Self.separatorThickness / 2)
        let separatorVertical_Right_X2  = separatorVertical_Right_X1 + Self.separatorThickness

        let separatorHorizontal_Top_Y1  = (boardY + boardHeight / 3) - (Self.separatorThickness / 2)
        let separatorHorizontal_Top_Y2  = separatorHorizontal_Top_Y1 + Self.separatorThickness
        
        let separatorHorizontal_Bottom_Y1  = (boardY + (boardHeight * 2) / 3) - (Self.separatorThickness / 2)
        let separatorHorizontal_Bottom_Y2  = separatorHorizontal_Bottom_Y1 + Self.separatorThickness
        
        
        //vertical, left
        boardSeparators[0].x = CGFloat(separatorVertical_Left_X1)
        boardSeparators[0].y = CGFloat(boardY)
        boardSeparators[0].width = CGFloat(Self.separatorThickness)
        boardSeparators[0].height = CGFloat(boardHeight)
        
        //vertical, right
        boardSeparators[1].x = CGFloat(separatorVertical_Right_X1)
        boardSeparators[1].y = CGFloat(boardY)
        boardSeparators[1].width = CGFloat(Self.separatorThickness)
        boardSeparators[1].height = CGFloat(boardHeight)
        
        //horizontal, top
        boardSeparators[2].x = CGFloat(boardX)
        boardSeparators[2].y = CGFloat(separatorHorizontal_Top_Y1)
        boardSeparators[2].width = CGFloat(boardWidth)
        boardSeparators[2].height = CGFloat(Self.separatorThickness)
        
        //horizontal, bottom
        boardSeparators[3].x = CGFloat(boardX)
        boardSeparators[3].y = CGFloat(separatorHorizontal_Bottom_Y1)
        boardSeparators[3].width = CGFloat(boardWidth)
        boardSeparators[3].height = CGFloat(Self.separatorThickness)
        
        
        // top left
        boardTiles[0].x = CGFloat(boardX)
        boardTiles[0].y = CGFloat(boardY)
        boardTiles[0].width = CGFloat(separatorVertical_Left_X1 - boardX)
        boardTiles[0].height = CGFloat(separatorHorizontal_Top_Y1 - boardY)
        
        // top middle
        boardTiles[1].x = CGFloat(separatorVertical_Left_X2)
        boardTiles[1].y = CGFloat(boardY)
        boardTiles[1].width = CGFloat(separatorVertical_Right_X1 - separatorVertical_Left_X2)
        boardTiles[1].height = CGFloat(separatorHorizontal_Top_Y1 - boardY)
        
        // top right
        boardTiles[2].x = CGFloat(separatorVertical_Right_X2)
        boardTiles[2].y = CGFloat(boardY)
        boardTiles[2].width = CGFloat(boardWidth - (separatorVertical_Right_X2 - boardX))
        boardTiles[2].height = CGFloat(separatorHorizontal_Top_Y1 - boardY)
        
        
        // middle left
        boardTiles[3].x = CGFloat(boardX)
        boardTiles[3].y = CGFloat(separatorHorizontal_Top_Y2)
        boardTiles[3].width = CGFloat(separatorVertical_Left_X1 - boardX)
        boardTiles[3].height = CGFloat(separatorHorizontal_Bottom_Y1 - separatorHorizontal_Top_Y2)
        
        // middle middle
        boardTiles[4].x = CGFloat(separatorVertical_Left_X2)
        boardTiles[4].y = CGFloat(separatorHorizontal_Top_Y2)
        boardTiles[4].width = CGFloat(separatorVertical_Right_X1 - separatorVertical_Left_X2)
        boardTiles[4].height = CGFloat(separatorHorizontal_Bottom_Y1 - separatorHorizontal_Top_Y2)
        
        // middle right
        boardTiles[5].x = CGFloat(separatorVertical_Right_X2)
        boardTiles[5].y = CGFloat(separatorHorizontal_Top_Y2)
        boardTiles[5].width = CGFloat(boardWidth - (separatorVertical_Right_X2 - boardX))
        boardTiles[5].height = CGFloat(separatorHorizontal_Bottom_Y1 - separatorHorizontal_Top_Y2)
        
        // bottom left
        boardTiles[6].x = CGFloat(boardX)
        boardTiles[6].y = CGFloat(separatorHorizontal_Bottom_Y2)
        boardTiles[6].width = CGFloat(separatorVertical_Left_X1 - boardX)
        boardTiles[6].height = CGFloat(boardHeight - (separatorHorizontal_Bottom_Y2 - boardY))
        
        // bottom middle
        boardTiles[7].x = CGFloat(separatorVertical_Left_X2)
        boardTiles[7].y = CGFloat(separatorHorizontal_Bottom_Y2)
        boardTiles[7].width = CGFloat(separatorVertical_Right_X1 - separatorVertical_Left_X2)
        boardTiles[7].height = CGFloat(boardHeight - (separatorHorizontal_Bottom_Y2 - boardY))
        
        // bottom right
        boardTiles[8].x = CGFloat(separatorVertical_Right_X2)
        boardTiles[8].y = CGFloat(separatorHorizontal_Bottom_Y2)
        boardTiles[8].width = CGFloat(boardWidth - (separatorVertical_Right_X2 - boardX))
        boardTiles[8].height = CGFloat(boardHeight - (separatorHorizontal_Bottom_Y2 - boardY))
    }
}

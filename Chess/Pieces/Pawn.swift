//
//  Pawn.swift
//  Chess
//
//  Created by Varun Rathi on 01/06/19.
//  Copyright © 2019 Varun Rathi. All rights reserved.
//

import UIKit

class Pawn: UIChessPiece {
    
    var tryAdvanceTwoSteps:Bool = false
    
    init(frame:CGRect, color:UIColor, vc:ChessViewController,pieceColor:PieceColor = .White)  {
        super.init(frame: frame)
        
        if (pieceColor ==  PieceColor.Black){
            self.text = "♙"
        }else
        {
            self.text = "♙"
        }
        
        self.symbol = pieceColor
        self.isOpaque = false
        self.textColor = color
        self.isUserInteractionEnabled = true
        self.textAlignment = . center
        self.font = self.font.withSize(36)
        
        vc.chessPieces.append(self)
        vc.view.addSubview(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func isMovePossible(from source: BoardIndex, destination: BoardIndex) -> Bool {
        
        // Two steps check
        if source.col == destination.col {
            
            if symbol == .White && source.row == 6 && destination.row == 4 {
                tryAdvanceTwoSteps = true
                return true
            }
            else if symbol == .Black && source.row == 1 && destination.row == 3{
                tryAdvanceTwoSteps = true
                return true
            }
            
        }
        
        tryAdvanceTwoSteps = false
        
        let moveForward = symbol == .Black ? 1 : -1
        
        if destination.row == source.row  + moveForward {
            
            if destination.col == source.col - 1 || destination.col == source.col || destination.col == source.col + 1 {
                return true
            }
        }
        
        return true
    }
    
}

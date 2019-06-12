//
//  ChessBoard.swift
//  Chess
//
//  Created by Varun Rathi on 01/06/19.
//  Copyright © 2019 Varun Rathi. All rights reserved.
//

import UIKit

class ChessBoard: NSObject {

    var board : [[Piece]]
    var vc:ChessViewController!
    let number_Row = 8
    let number_Col = 8
    var whiteKing:Piece!
    var blackKing:Piece!
    
    
    func getFrame(forRow row:Int, forCol col:Int)->CGRect {
        let x  = (ChessViewController.SPACE_FROM_LEFT_EDGE + col * ChessViewController.tileSize)
        let y = (ChessViewController.SPACE_FROM_TOP_EDGE + row * ChessViewController.tileSize)
        return CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width:ChessViewController.tileSize, height: ChessViewController.tileSize))
    
    }
    
    init(controller:ChessViewController) {
    
    vc = controller
    
    // Init matrix with dummies
    
    let dummyRow = Array(repeating:Dummy(), count: number_Col)
    self.board = Array(repeating: dummyRow, count: number_Row)
}
}

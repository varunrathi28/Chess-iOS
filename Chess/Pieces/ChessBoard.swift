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
    
    
    static  func getFrame(forRow row:Int, forCol col:Int)->CGRect {
        let x  = (ChessViewController.SPACE_FROM_LEFT_EDGE + col * ChessViewController.tileSize)
        let y = (ChessViewController.SPACE_FROM_TOP_EDGE + row * ChessViewController.tileSize)
        return CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width:ChessViewController.tileSize, height: ChessViewController.tileSize))
        
    }
    
    init(controller:ChessViewController) {
        
        vc = controller
        
        // Init matrix with dummies
        
        let dummyRow = Array(repeating:Dummy(), count: number_Col)
        self.board = Array(repeating: dummyRow, count: number_Row)
        
        for row in 0..<number_Row {
            
            for col in 0..<number_Col {
                
                
                let frame = ChessBoard.getFrame(forRow: row, forCol: col)
                
                switch row {
                    
                case 0:
                    switch col {
                        
                    case 0 :
                        
                        board[row][col] = Rook(frame: frame, color: UIColor.white, vc: vc)
                        
                    case 1:
                        board[row][col] = Knight(frame: frame, color: UIColor.white, vc: vc)
                        
                    case 2:
                        board[row][col] = Bishop(frame: frame, color: UIColor.white, vc: vc)
                        
                    case 3:
                        board[row][col] = Queen(frame: frame, color: UIColor.white, vc: vc)
                        
                    case 4:
                        whiteKing = King(frame: frame, color: UIColor.white, vc: vc)
                        board[row][col] = whiteKing
                        
                    case 5:
                        board[row][col] = Bishop(frame: frame, color: UIColor.white, vc: vc)
                        
                    case 6:
                        board[row][col] = Knight(frame: frame, color: UIColor.white, vc: vc)
                        
                    case 7:
                        board[row][col] = Rook(frame: frame, color: UIColor.white, vc: vc)
                        
                    default:
                        board[row][col] =  Dummy(with: frame)
                        
                    }
                    
                case 1:
                    switch col {
                    default:
                        board[row][col] = Pawn(frame: frame, color: UIColor.white, vc: vc)
                    }
                    
                case 6:
                    switch col {
                    default:
                        board[row][col] = Pawn(frame: frame, color: UIColor.black, vc: vc)
                    }
                    
                case 7:
                    switch col {
                        
                    case 0 :
                        
                        board[row][col] = Rook(frame: frame, color: UIColor.black, vc: vc)
                        
                    case 1:
                        board[row][col] = Knight(frame: frame, color: UIColor.black, vc: vc)
                        
                    case 2:
                        board[row][col] = Bishop(frame: frame, color: UIColor.black, vc: vc)
                        
                    case 3:
                        whiteKing = King(frame: frame, color: UIColor.black, vc: vc)
                        board[row][col] = whiteKing
                        
                    case 4:
                         board[row][col] = Queen(frame: frame, color: UIColor.black, vc: vc)
                        
                    case 5:
                        board[row][col] = Bishop(frame: frame, color: UIColor.black, vc: vc)
                        
                    case 6:
                        board[row][col] = Knight(frame: frame, color: UIColor.black, vc: vc)
                        
                    case 7:
                        board[row][col] = Rook(frame: frame, color: UIColor.black, vc: vc)
                        
                    default:
                        board[row][col] =  Dummy(with: frame)
                        
                    }
                    
                default:
                    board[row][col] = Dummy(with: frame)
                    
                }
            }
        }
    }
}



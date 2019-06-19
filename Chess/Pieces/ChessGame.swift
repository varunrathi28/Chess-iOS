 //
//  ChessGame.swift
//  Chess
//
//  Created by Varun Rathi on 01/06/19.
//  Copyright © 2019 Varun Rathi. All rights reserved.
//

import UIKit

class ChessGame:NSObject {

    var chessBoard:ChessBoard!
    init(viewController:ChessViewController){
        chessBoard = ChessBoard.init(controller: viewController)
    }
    
    func isValidMove(with piece:UIChessPiece, from sourceIndex:BoardIndex, to destinationIndex:BoardIndex)-> Bool {
    
    guard isMoveOnBoard(from: sourceIndex, to: destinationIndex) else {
            print("Move out of Board bounds:\(sourceIndex)-\(destinationIndex)")
            return false
        }
        return true
    }
    
    

    func move(piece pieceToMove:UIChessPiece, from sourceIndex:BoardIndex, to destinationIndex:BoardIndex, to origin:CGPoint){
    
    //1. initial Frame
        let sourceFrame = pieceToMove.frame
        
        
    //2. find the piece to remove and remove it
        
        let pieceToRemove = chessBoard.board[destinationIndex.row][destinationIndex.col]
        chessBoard.removePiece(piece: pieceToRemove)
        
    //3. Place the piece
        chessBoard.place(piece: pieceToMove, to: destinationIndex, origin: origin)
        
    //4/ Put dummy piece at Source Location
        chessBoard.board[sourceIndex.row][sourceIndex.col] = Dummy(with: sourceFrame)
    }
    
    
    
    func isMoveOnBoard(from sourceIndex:BoardIndex,to destinationIndex:BoardIndex)-> Bool{
        
        if case 0..<chessBoard.number_Row = sourceIndex.row {
            
            if case 0..<chessBoard.number_Col = sourceIndex.col {
                
                if case 0..<chessBoard.number_Row = destinationIndex.row {
                    
                    if case 0..<chessBoard.number_Col = destinationIndex.col {
                        
                        return true
                    }
                    
                }
            }
            
        }
        return false
    }

 }


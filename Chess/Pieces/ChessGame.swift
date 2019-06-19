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
    var isWhiteTurn:Bool = true
    
    
    init(viewController:ChessViewController){
        chessBoard = ChessBoard.init(controller: viewController)
    }
    
    func resetGame(){
    isWhiteTurn = true
   
    }
    
    // Check
    //1. Out of bounds
    //2. Check correct turn
    //3  Check turn on same color
    //4. Check turn on same index, Source == destination
    
    func isValidMove(with piece:UIChessPiece, from sourceIndex:BoardIndex, to destinationIndex:BoardIndex)-> Bool {
    
    // Check move with the board indices
    guard isMoveOnBoard(from: sourceIndex, to: destinationIndex) else {
            print("Move out of Board bounds:\(sourceIndex)-\(destinationIndex)")
            return false
        }
        
        // Check the correct turn
        guard self.isTurnColorSame(with: piece) else {
            return false
        }
        
        return isNormalMoveValid(with: piece, from: sourceIndex, to: destinationIndex)
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
    
    func nextTurn(){
            isWhiteTurn = !isWhiteTurn
    }
    
    
    func isTurnColorSame(with piece:UIChessPiece)->Bool {
    
        if piece.symbol == .Black && isWhiteTurn == false {
            return true
        }
        else if piece.symbol == .White && isWhiteTurn {
            return true
        }
        return false
    }
    
    func isNormalMoveValid(with piece:UIChessPiece,from sourceIndex:BoardIndex, to destinationIndex:BoardIndex)->Bool{
    
        
        guard sourceIndex != destinationIndex else {
        return false
        }
        
        guard !isAttackingAlliedPiece(piece: piece, destination: destinationIndex) else {
            return false
        }
        
        return true
    }
    
    func isAttackingAlliedPiece(piece:UIChessPiece,destination:BoardIndex)->Bool {
        let destinationPiece = chessBoard.board[destination.row][destination.col]
        
        guard (destinationPiece is Dummy) == false else {
            return false
        }
        
        return piece.symbol == destinationPiece.symbol
    }
    
 }


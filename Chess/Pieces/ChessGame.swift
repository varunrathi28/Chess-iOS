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
    
        return true
    }


 }


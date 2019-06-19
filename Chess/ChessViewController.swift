//
//  ChessViewController.swift
//  Chess
//
//  Created by Varun Rathi on 01/06/19.
//  Copyright © 2019 Varun Rathi. All rights reserved.
//

import UIKit

class ChessViewController: UIViewController {

    @IBOutlet weak var lblDisplayTurn:UILabel!
    @IBOutlet weak var lblCheckStatus:UILabel!
    @IBOutlet weak var panGesture:UIPanGestureRecognizer!
    
    var pieceDragged:UIChessPiece!
    var startOrigin: CGPoint!
    var endOrigin:CGPoint!
    
    static  var SPACE_FROM_LEFT_EDGE:Int = 36
    static  var SPACE_FROM_TOP_EDGE:Int = 148
    static var tileSize:Int = 38
    var chessGame:ChessGame!
    var chessPieces:[UIChessPiece]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         chessPieces = []
        initializeGameScene()
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func initializeGameScene(){
    
        for chessPiece in chessPieces {
            chessPiece.removeFromSuperview()
        }
    
        chessGame = ChessGame.init(viewController: self)
    }
    
    
    @IBAction func newGameTapped(){
    
        initializeGameScene()
    
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let dragged = touches.first?.view as? UIChessPiece {
            pieceDragged = dragged
            startOrigin = pieceDragged.frame.origin
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if pieceDragged != nil  {
        drag(piece: pieceDragged, using: panGesture)
        }
    }


    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if pieceDragged != nil{
            
            let touchCoordinate = touches.first!.location(in: view)
            
            var x = Int(touchCoordinate.x)
            var y = Int(touchCoordinate.y)
            
            x -= ChessViewController.SPACE_FROM_LEFT_EDGE
            y -= ChessViewController.SPACE_FROM_TOP_EDGE
        
            x = (x / ChessViewController.tileSize) * ChessViewController.tileSize
            y = (y / ChessViewController.tileSize) * ChessViewController.tileSize
            
            x += ChessViewController.SPACE_FROM_LEFT_EDGE
            y += ChessViewController.SPACE_FROM_TOP_EDGE
            
           endOrigin  = CGPoint(x: x, y: y)
           
           
           let sourceIndex = ChessBoard.indexOf(origin: startOrigin)
           let destinationIndex = ChessBoard.indexOf(origin: endOrigin)
           
         
            // Change origin to new origin for valid move
            
            if chessGame.isValidMove(with: pieceDragged, from: sourceIndex, to: destinationIndex){
            
                chessGame.move(piece: pieceDragged, from: sourceIndex, to: destinationIndex, to: endOrigin)
            
              //  pieceDragged.frame.origin = endOrigin
                
                //TODO:- Play retract sound
            }
            // reset the piece to original location for invalid move.
            else {
                pieceDragged.frame.origin = startOrigin
                
                //TODO:- Play board sound for successfull move
            }
         
        }
        
    }
    
    func drag(piece:UIChessPiece,using gestureRecognizer:UIPanGestureRecognizer){
    
        let translation  = gestureRecognizer.translation(in: view)
        let newCenterX = translation.x + piece.center.x
        let newCenterY = translation.y + piece.center.y
        piece.center = CGPoint(x: newCenterX, y: newCenterY)
        gestureRecognizer.setTranslation(CGPoint.zero, in: view)
    
    }


}


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
    
    static  var SPACE_FROM_LEFT_EDGE:Int = 8
    static  var SPACE_FROM_TOP_EDGE:Int = 8
    static var tileSize:Int = 38
    var chessGame:ChessGame!
    var chessPieces:[UIChessPiece]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}


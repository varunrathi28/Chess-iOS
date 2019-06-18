//
//  Piece.swift
//  Chess
//
//  Created by Varun Rathi on 01/06/19.
//  Copyright © 2019 Varun Rathi. All rights reserved.
//

import UIKit

protocol Piece {

    var x:CGFloat {get set}
    var y:CGFloat {get set}
    
    var symbol:String { get }

}

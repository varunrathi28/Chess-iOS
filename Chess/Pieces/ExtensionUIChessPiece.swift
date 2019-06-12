//
//  ExtensionUIChessPiece.swift
//  Chess
//
//  Created by Varun Rathi on 01/06/19.
//  Copyright © 2019 Varun Rathi. All rights reserved.
//

import UIKit

//typealias UIChessPiece = UILabel


public class UIChessPiece:UILabel,Piece {
    var symbol: String = ""
}


//extension UIChessPiece: Piece {

extension UIChessPiece{


    var color : UIColor {
        return self.textColor
    }

    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
            
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    

}

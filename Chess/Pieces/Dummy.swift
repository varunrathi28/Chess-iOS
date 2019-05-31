//
//  Dummy.swift
//  Chess
//
//  Created by Varun Rathi on 01/06/19.
//  Copyright © 2019 Varun Rathi. All rights reserved.
//

import UIKit

class Dummy :Piece {
    
    private var xStorage:CGFloat!
    private var yStorage:CGFloat!

    var x: CGFloat{
    
        get {
        
            return self.xStorage
        }
        set {
        
            self.xStorage = newValue
        }
    
    
    }
    
    var y: CGFloat{
    
        get {
            return self.yStorage
        }
        
        set {
            self.yStorage = newValue
        
        }
    
    }
    
    init(with frame:CGRect) {
    
    self.xStorage = frame.origin.x
    self.yStorage = frame.origin.y
}
    
    
    init() {
    
}

}

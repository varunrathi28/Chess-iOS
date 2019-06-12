//
//  BoardIndex.swift
//  Chess
//
//  Created by Varun Rathi on 01/06/19.
//  Copyright © 2019 Varun Rathi. All rights reserved.
//

import Foundation


struct BoardIndex:Equatable {
    
    var row:Int
    var col:Int
    
    init(row:Int, col:Int) {
        self.row = row
        self.col = col
    }
    
    static func == (lhs:BoardIndex, rhs:BoardIndex)->Bool {
    return lhs.row == rhs.row && lhs.col == rhs.col
    }
    
}

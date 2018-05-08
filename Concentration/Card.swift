//
//  Card.swift
//  Concentration
//
//  Created by Kovalenko Ilia on 07.05.2018.
//  Copyright © 2018 Kovalenko Ilia. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqIdentifier()
    }
}

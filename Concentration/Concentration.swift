//
//  Concentration.swift
//  Concentration
//
//  Created by Kovalenko Ilia on 07.05.2018.
//  Copyright © 2018 Kovalenko Ilia. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]() 
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // Either no cards or two cards face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCard: Int) {
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]
        }
        //TODO Shuffle the cards
        for _ in 0..<(cards.count - 1) {
            cards.sort{ (_,_) in arc4random() < arc4random() }
        }
    }
    
}

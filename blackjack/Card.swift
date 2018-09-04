//
//  Card.swift
//  blackjack
//
//  Created by Formative Mini on 9/3/18.
//  Copyright © 2018 Formative Web Solutions. All rights reserved.
//

import Foundation

class Card {
    let suit: String
    let rank: String
    var label: String {
        return rank + suit
    }
    var value: UInt {
        switch rank {
        case "A":
            return 1
        case "J", "K", "Q":
            return 10
        default:
            if let value = UInt(rank) {
                return value
            } else {
                return 0
            }
        }
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
}

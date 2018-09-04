//
//  Player.swift
//  blackjack
//
//  Created by Formative Mini on 9/3/18.
//  Copyright © 2018 Formative Web Solutions. All rights reserved.
//

import Foundation

class Player {
    let name: String
    var wallet: UInt
    var hand: [Card]
    var handSize: Int {
        return hand.count
    }
    var handValue: UInt {
        // There's a bit of a hitch here: Aces can be worth 1 or 11.
        // Here, we add up the score with aces worth both 1 and 11. If
        // making aces worth 11 is still 21 or less, we return that value;
        // otherwise, we return the value with aces being 1.
        // This doesn't handle cases in which a player may have 2 or more
        // aces and want to treat one as 1 and the other as 11, but for
        // this lab we won't worry about that.
        let aces1 = hand.reduce(0) { (sum, card) in
            return sum + Int(card.value)
        }
        let aces10 = hand.reduce(0) { (sum, card) in
            let value = card.rank == "A" ? 11 : card.value
            return sum + Int(value)
        }
        if aces10 <= 21 {
            return UInt(aces10)
        } else {
            return UInt(aces1)
        }
    }
    var isBlackjack: Bool {
        return handValue == 21
    }
    var isBusted: Bool {
        return handValue > 21
    }
    
    init(name: String) {
        self.name = name
        self.wallet = 100
        self.hand = []
    }
    
    func dealCard(card: Card) {
        hand.append(card)
    }
    
    func willHit(bet: UInt) -> Bool {
        return handValue < 21 && canPlaceBet(bet: bet)
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        return bet <= wallet
    }
    
    func win(amount: UInt) {
        wallet += amount
    }
    
    func lose(amount: UInt) {
        wallet -= amount
    }
}

//
//  Dealer.swift
//  blackjack
//
//  Created by Formative Mini on 9/3/18.
//  Copyright © 2018 Formative Web Solutions. All rights reserved.
//

import Foundation

class Dealer {
    let deck: Deck
    let player: Player
    let house: House
    var currentBet: UInt
    var playerTurns: UInt
    var winningPlayer: Player?
    var winner: Player? {
        if let _ = winningPlayer {
            return winningPlayer
        }
        
        if playerTurns < 2 {
            return nil
        }
        
        if player.isBusted {
            return house
        }
        
        if house.isBusted {
            return player
        }
        
        if player.handValue > house.handValue {
            return player
        } else {
            return house
        }
    }
    
    init() {
        deck = Deck()
        player = Player(name: "Player")
        house = House()
        currentBet = 0
        playerTurns = 0
        winningPlayer = nil
    }
    
    func placeBet(bet: UInt) -> Bool {
        guard player.canPlaceBet(bet: bet) && house.canPlaceBet(bet: bet) else { return false }
        currentBet = bet
        return true
    }
    
    func deal() {
        player.dealCard(card: deck.drawCard()!)
        player.dealCard(card: deck.drawCard()!)
        house.dealCard(card: deck.drawCard()!)
        house.dealCard(card: deck.drawCard()!)
        
        if player.isBlackjack {
            winningPlayer = player
        }
        
        if house.isBlackjack {
            winningPlayer = house
        }
    }
    
    func turn(player: Player) {
        while player.willHit(bet: currentBet) && player.handSize <= 5 {
            player.dealCard(card: deck.drawCard()!)
        }
        playerTurns += 1
    }
    
    func award() {
        guard winner != nil else { return }
        winner!.win(amount: currentBet)
        if let _ = winner as? House {
            player.lose(amount: currentBet)
        } else {
            house.lose(amount: currentBet)
        }
    }
}

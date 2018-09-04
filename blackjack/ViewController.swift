//
//  ViewController.swift
//  blackjack
//
//  Created by Formative Mini on 9/3/18.
//  Copyright © 2018 Formative Web Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var winnerLabel: UILabel!
    
    var dealer = Dealer()
    
    func playGame() -> Player {
        var turn = "player"
        dealer.deal()
        
        if let _ = dealer.winner {
            dealer.award()
        }
        
        while dealer.winner == nil {
            let player = turn == "player" ? dealer.house : dealer.player
            dealer.turn(player: player)
            turn = turn == "player" ? "house" : "player"
        }
        
        dealer.award()
        return dealer.winner!
    }
    
    @IBAction func playGamePressed(_ sender: UIButton) {
        dealer = Dealer()
        winnerLabel.text = playGame().name

    }
}


//
//  House.swift
//  blackjack
//
//  Created by Formative Mini on 9/3/18.
//  Copyright © 2018 Formative Web Solutions. All rights reserved.
//

import Foundation

class House: Player {
    init() {
        super.init(name: "House")
    }
    
    override func willHit(bet: UInt) -> Bool {
        return handValue < 17
    }
}

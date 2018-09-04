//
//  Shuffle.swift
//  blackjack
//
//  Created by Formative Mini on 9/3/18.
//  Copyright © 2018 Formative Web Solutions. All rights reserved.
//

import Foundation

extension MutableCollection where Index == Int {
    mutating func shuffleInPlace() {
        // Borrowed from: <https://codedump.io/share/OCJt0TU9IfzE/1/how-do-i-shuffle-an-array-in-swift>
        guard count > 1 else { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            self.swapAt(i, j)
        }
    }
}

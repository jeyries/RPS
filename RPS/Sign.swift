//
//  Sign.swift
//  RPS
//
//  Created by Julien Eyriès on 04/12/2020.
//  Copyright © 2020 Matthew Hanlon. All rights reserved.
//

import Foundation

func randomSign() -> Sign {
    let number = Int.random(in: 0 ... 2)
    if number == 0 {
        return .rock
    } else if number == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock
    case paper
    case scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "🖐"
        case .scissors:
            return "✌️"
        }
    }
    
    func gameState(against opponentSign: Sign) -> GameState {
        if opponentSign == self {
            return .draw
        }
        
        if self == .rock && opponentSign == .scissors {
            return .win
        }
        
        if self == .paper && opponentSign == .rock {
            return .win
        }
        
        if self == .scissors && opponentSign == .paper {
            return .win
        }
        
        return .lose
    }
}

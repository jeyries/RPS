//
//  RootView.swift
//  RPS
//
//  Created by Julien Eyriès on 04/12/2020.
//  Copyright © 2020 Matthew Hanlon. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @State var gameState: GameState = .start
    @State var selectedSign: Sign!
    @State var opponentSign: Sign!
    
    var body: some View {
        VStack(spacing: 20) {
            Text(titleLabel)
                .font(.system(size: 40))
            Text(subtitleLabel)
            
            HStack {
                if gameState == .start {
                    Button(action: selectRock) {
                        Text(Sign.rock.emoji)
                            .font(.system(size: 40))
                    }
                    Button(action: selectPaper) {
                        Text(Sign.paper.emoji)
                            .font(.system(size: 40))
                    }
                    Button(action: selectRock) {
                        Text(Sign.scissors.emoji)
                            .font(.system(size: 40))
                    }
                } else {
                    Button(action: selectPaper) {
                        Text(selectedSign!.emoji)
                            .font(.system(size: 40))
                    }
                }
            }
            
            if gameState != .start {
                Button(action: playAgain) {
                    Text("Play Again")
                }
            }
            
        }
        
    }
    
    var titleLabel: String {
        switch gameState {
        case .start:
            return "🤖"
        default:
            return opponentSign.emoji
        }
    }
    
    var subtitleLabel: String {
        switch gameState {
        case .start:
            return "Rock, Paper or Scissors ?"
        case .win:
            return "You won !"
        case .lose:
            return "You lose !"
        case .draw:
            return "Draw !"
        }
    }
    
    func selectRock() {
        selectedSign = .rock
        opponentSign = randomSign()
        gameState = selectedSign.gameState(against: opponentSign)
    }
    
    func selectPaper() {
        selectedSign = .paper
        opponentSign = randomSign()
        gameState = selectedSign.gameState(against: opponentSign)
    }
    
    func selectScissors() {
        selectedSign = .scissors
        opponentSign = randomSign()
        gameState = selectedSign.gameState(against: opponentSign)
    }
    
    func playAgain() {
        selectedSign = nil
        opponentSign = nil
        gameState = .start
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

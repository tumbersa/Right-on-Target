//
//  GameRound.swift
//  Right on Target
//
//  Created by Глеб Капустин on 11.11.2023.
//

import Foundation

final class GameRound: GameRoundProtocol {
    static let shared = GameRound()
    
    var score: Int = 0
    
    var currentSecretValue: Int = 0
    
    
    func calculateStore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
    
    
}

//
//  Game.swift
//  Right on Target
//
//  Created by Глеб Капустин on 11.11.2023.
//

import Foundation

final class GameInt: GameProtocol {
    var gameRound: GameRoundProtocol!
    var generator: GeneratorProtocol!
    var minSecretValue: Int
    var maxSecretValue: Int
    
    private var lastRound: Int
    private var currentRound: Int = 1
    var isGameEnded: Bool {
        currentRound >= lastRound
    }
    
    init?(startValue: Int,endValue: Int,rounds: Int) {
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        generator = Generator()
        gameRound = GameRound.shared
        gameRound.currentSecretValue = generator.getRandomValue(minValue: minSecretValue, maxValue: maxSecretValue)
    }
    
    
    
    func restartGame() {
        gameRound.score = 0
        gameRound.currentSecretValue = 0
        startNewRound()
    }
    
    func startNewRound() {
        gameRound.currentSecretValue = generator.getRandomValue(minValue: minSecretValue, maxValue: maxSecretValue)
        currentRound += 1
    }
    
}

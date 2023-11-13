//
//  GameProtocol.swift
//  Right on Target
//
//  Created by Глеб Капустин on 11.11.2023.
//

import Foundation

protocol GameProtocol {
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
}

protocol GeneratorProtocol {
    func getRandomValue(minValue: Int, maxValue: Int) -> Int
}

protocol GameRoundProtocol{
    var score: Int { get set }
    var currentSecretValue: Int { get set }
    func calculateStore(with: Int)
}

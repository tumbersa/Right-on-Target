//
//  GameColor.swift
//  Right on Target
//
//  Created by Глеб Капустин on 13.11.2023.
//

import UIKit

final class GameColor: GameProtocol {
    let generator = Generator()
    private (set) var secretStringColor: String = ""
    
    private (set) var secretColor: UIColor = UIColor()
    private (set) var numCorrectVar: Int = 0
    private (set) var score: Int = 0
    private (set) var rounds: Int = 0
    
    var isGameEnded: Bool = false
    
    func restartGame() {
        isGameEnded = false
        score = 0
        rounds = 0
        startNewRound()
    }
    
    func startNewRound() {
        secretStringColor = generator.getRandomHexColor()
        
        secretColor = UIColor(hex: secretStringColor) ?? UIColor()
       
        numCorrectVar = generator.getRandomValue(minValue: 1, maxValue: 4)
        
        rounds += 1
        if rounds == 5 {
            isGameEnded = true
        }
    }
    
    func plusOneScore(){
        score += 1
    }
    
}

//
//  ColorViewController.swift
//  Right on Target
//
//  Created by Глеб Капустин on 13.11.2023.
//

import UIKit
final class ColorViewController: UIViewController {
    private var gameColor = GameColor()

    @IBOutlet var secretColorLabel: UILabel!
    
    @IBOutlet var varButtons: [UIButton]!
    
    
    @IBAction func nextRound(){
        if gameColor.isGameEnded {
            showAlertWith(score: gameColor.score)
            gameColor.restartGame()
            updateScreen()
        } else {
            gameColor.startNewRound()
            updateScreen()
        }
    }
    
    @IBAction func hideCurrentScreen(){
        self.dismiss(animated: true)
    }
    
    @IBAction func checkColor(_ sender: UIButton){
        if sender.tag == gameColor.numCorrectVar {
            highlightButton(button: sender,flag: true)
            gameColor.plusOneScore()
        } else {
            highlightButton(button: sender, flag: false)
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameColor.startNewRound()
        updateScreen()
    }
    
    private func removeBacklight(buttons: [UIButton]){
        for i in buttons {
            i.layer.masksToBounds = false
            i.layer.borderWidth = 0
            i.layer.borderColor = .none
        }
    }
    
    private func showAlertWith(score: Int) {
        //выводим алерт с результатами игры
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        let alertAction = UIAlertAction(
            title: "Начать заново",
            style: .default,
            handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true,completion: nil)
    }
    private func highlightButton(button: UIButton,flag: Bool){
        button.layer.masksToBounds = false
        button.layer.borderWidth = 10
        if flag{
            button.layer.borderColor = UIColor.green.cgColor
        } else {
            button.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    private func updateScreen(){
        
        secretColorLabel.backgroundColor = UIColor(hex: gameColor.secretStringColor)
        for i in varButtons {
            if i.tag == gameColor.numCorrectVar {
                i.setTitle(gameColor.secretStringColor, for: .normal)
            } else {
                i.setTitle(gameColor.generator.getRandomHexColor(), for: .normal)
            }
        }
        removeBacklight(buttons: varButtons)
    }
}


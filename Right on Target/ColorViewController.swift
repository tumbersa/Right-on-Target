//
//  ColorViewController.swift
//  Right on Target
//
//  Created by Глеб Капустин on 13.11.2023.
//

import UIKit
final class ColorViewController: UIViewController {
    
    private let generator = Generator()
    private var secretStringColor: String = ""
    
    private var secretColor: UIColor!
    private var numCorrectVar: Int = 0
    private var score: Int = 0
    private var rounds: Int = 0
    
    @IBOutlet var secretColorLabel: UILabel!
    
    @IBOutlet var varButtons: [UIButton]!
    
    
    @IBAction func nextRound(){
        updateGame()
        if rounds == 5 {
            showAlertWith(score: score)
            rounds = 0
            score = 0
            updateGame()
        }
    }
    
    @IBAction func hideCurrentScreen(){
        self.dismiss(animated: true)
    }
    
    @IBAction func checkColor(_ sender: UIButton){
        if sender.tag == numCorrectVar {
            highlightButton(button: sender,flag: true)
            score += 1
        } else {
            highlightButton(button: sender, flag: false)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateGame()
        
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
    
    private func updateGame(){
        secretStringColor = generator.getRandomHexColor()
        
        secretColor = UIColor(hex: secretStringColor)
        secretColorLabel.backgroundColor = secretColor
        
        numCorrectVar = generator.getRandomValue(minValue: 1, maxValue: 4)
        
        for i in varButtons {
            if i.tag == numCorrectVar {
                i.setTitle(secretStringColor, for: .normal)
            } else {
                i.setTitle(generator.getRandomHexColor(), for: .normal)
            }
        }
        rounds += 1
        removeBacklight(buttons: varButtons)
    }
    
    
}


//
//  ViewController.swift
//  Right on Target
//
//  Created by Глеб Капустин on 14.10.2023.
//

import UIKit

class IntViewController: UIViewController {
    private var game: GameProtocol!
    private var gameRound: GameRound!
   
    
    
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var label: UILabel!
    
    @IBAction func hideCurrentScreen(){
        self.dismiss(animated: true)
    }
    
    
    // MARK: - Жизненный цикл
    override func loadView() {
        super.loadView()
        
        print("loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        gameRound = GameRound.shared
        
       updateLabelWithSecretNumber(newText: String(gameRound.currentSecretValue))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillApear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidApear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisapear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisapear")
    }
    
    
    // MARK: - Взаимодействие View - Model
    @IBAction func checkNumber() {
        
        let numSlider = Int(slider.value.rounded())
        
        gameRound.calculateStore(with: numSlider)
        
        if game.isGameEnded  {
            
            showAlertWith(score: gameRound.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(gameRound.currentSecretValue))
        
    }
    
    
    // MARK: - Обновление View
    private func updateLabelWithSecretNumber(newText: String ) {
        label.text = newText
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
}


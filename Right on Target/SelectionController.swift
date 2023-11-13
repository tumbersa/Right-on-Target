//
//  SelectionController.swift
//  Right on Target
//
//  Created by Глеб Капустин on 13.11.2023.
//

import UIKit

final class SelectionController: UIViewController {
    lazy var colorViewController = getColorViewController()
    
    lazy var intViewController = getIntViewController()
    
    @IBAction func showIntViewController(){
        self.present(intViewController, animated: true)
    }
    
    @IBAction func showColorViewController(){
        self.present(colorViewController, animated: true)
    }
    
    private func getColorViewController()-> ColorViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ColorViewController")
        return viewController as! ColorViewController
    }
    
    private func getIntViewController()-> IntViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "IntViewController")
        return viewController as! IntViewController
    }
}

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
    
    override func loadView() {
        super.loadView()
        
        print("loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
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

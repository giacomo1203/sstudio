//
//  MyCoachViewController.swift
//  SoccerStudio
//
//  Created by Luis Marca on 2/07/22.
//


import UIKit

class MyCoachViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Coach"
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
        // Do any additional setup after loading the view.
    }
    
    
}

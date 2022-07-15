//
//  LoginViewController.swift
//  SoccerStudio
//
//  Created by Luis Marca on 2/07/22.
//

import UIKit
import SlideMenuControllerSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailContainer: UIView!
    @IBOutlet weak var passwordContainer: UIView!
    @IBOutlet weak var button: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        
        emailContainer.layer.cornerRadius = 16.0
        emailContainer.clipsToBounds = true
        
        passwordContainer.layer.cornerRadius = 16.0
        passwordContainer.clipsToBounds = true
        
        button.layer.cornerRadius = 16.0
        button.clipsToBounds = true
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onHome(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! ContainerViewController
        let leftViewController = storyBoard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        
        UINavigationBar.appearance().tintColor = UIColor(hex: "24624F")
        
        leftViewController.mainViewController = nvc
        
        let slideMenuController = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        //slideMenuController.delegate = mainViewController as! SlideMenuControllerDelegate
    
        UIApplication.shared.windows.first?.rootViewController = slideMenuController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

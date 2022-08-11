//
//  LoginViewController.swift
//  SoccerStudio
//
//  Created by Luis Marca on 2/07/22.
//

import UIKit

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
        
        addStyleToElements()
        // Do any additional setup after loading the view.
    }
    
    @objc private func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func addStyleToElements() {
        self.navigationItem.hidesBackButton = true
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: -10, y: 10, width: 20, height: 20))
        if let imgBackArrow = UIImage.init(named: "arrow_left")?.withRenderingMode(.alwaysTemplate) {
            imageView.image = imgBackArrow
            imageView.contentMode = .center
            imageView.tintColor = .white
        }
        customView.addSubview(imageView)
        let backTap = UITapGestureRecognizer(target: self, action: #selector(self.backButtonPressed))
        customView.addGestureRecognizer(backTap)
        let leftBarButtonItem = UIBarButtonItem(customView: customView)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    
    
    @IBAction func onHome(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateInitialViewController()!
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
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

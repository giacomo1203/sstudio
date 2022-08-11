//
//  RevealViewController.swift
//  SoccerStudio
//
//  Created by Luis Marca on 20/07/22.
//

import UIKit

class RevealViewController: SWRevealViewController {

    var opacityView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicSetup()
    }
    
    func basicSetup() {
        self.delegate = self
        /*
        opacityView = UIView(frame: UIScreen.main.bounds)
        opacityView.backgroundColor = UIColor.quickColorWith(red: 0, green: 0, blue: 0, alpha: 0.45)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SWRevealViewController.revealToggle(_:)))
        opacityView.addGestureRecognizer(tapGesture)
 */
    }
    
    func moveToShowAllContent() {
        revealController(revealController: self, animateToPosition: .left)
    }
}

extension RevealViewController: SWRevealViewControllerDelegate {
    
    @nonobjc func revealController(revealController: SWRevealViewController!, animateToPosition position: FrontViewPosition) {
        
        if position == .right {
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                
                self.opacityView.alpha = 0.0
                self.frontViewController.view.addSubview(self.opacityView)
                self.opacityView.alpha = 1.0
                self.view.addGestureRecognizer(self.panGestureRecognizer())
                }, completion: { (completed) in
                    self.opacityView.alpha = 1.0
            })
        }
        
        else {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                
                self.opacityView.alpha = 0.0
                }, completion: { (completed) in
         
                    self.view.removeGestureRecognizer(self.panGestureRecognizer())
                    self.opacityView.removeFromSuperview()
            })
        }
    }
}


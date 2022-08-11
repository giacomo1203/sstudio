//
//  ContentViewController.swift
//  SoccerStudio
//
//  Created by Luis Marca on 20/07/22.
//

import UIKit
import TabsPager

class ContentViewController: TabsPagerContentVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let indexLabel = UILabel()
        indexLabel.text = tabTitle
        indexLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        indexLabel.textColor = .darkGray
        view.addSubview(indexLabel)
        indexLabel.centerInSuperView()
        
        let image = UIImageView(image: UIImage(named: "backplayer"))
        view.addSubview(image)
        image.fillSuperview()
        
        // Do any additional setup after loading the view.
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

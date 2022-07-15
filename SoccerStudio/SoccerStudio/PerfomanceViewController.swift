//
//  PerfomanceViewController.swift
//  SoccerStudio
//
//  Created by Luis Marca on 14/07/22.
//

import UIKit

class PerfomanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Player perfomance"

        let back = UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style:.plain, target: nil, action: nil)
        
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

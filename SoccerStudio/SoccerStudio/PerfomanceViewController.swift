//
//  PerfomanceViewController.swift
//  SoccerStudio
//
//  Created by Luis Marca on 14/07/22.
//

import UIKit
import TabsPager

class PerfomanceViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var tabsPager = TabsPager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Player perfomance"
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
        
        setTabPager()
        // Do any additional setup after loading the view.
    }
    
    private func setTabPager() {
        
        // 1. Set TabPager attributes if you want before assign viewControllers
        tabsPager.tabColor = .white
        tabsPager.tabLineColor = UIColor(hex: "183E33")
        tabsPager.backgroundColor = .gray
        tabsPager.tabTitleColor = UIColor(hex: "959595")
        tabsPager.tabSelectedTitleColor = UIColor(hex: "183E33")
        tabsPager.sliderColor = UIColor(hex: "183E33")
        tabsPager.tabTextFont = .boldSystemFont(ofSize: 20)
        
        // 2. Add tabPage to your view
        self.addChild(tabsPager)
        view.addSubview(tabsPager.view)
        tabsPager.view.fillSuperview()
        
        // 3. Set viewControlles
        setControllers()
    }
    
    private func setControllers() {
        
        let tabs = Manager.shared.categories.map { item in
            item.name
        }
        
        var vcs: [ContentViewController] = [] // ViewController must inherit TabPagerContentVC
        for (i, title) in tabs.enumerated() {
            let vc = ContentViewController()
            vc.pageIndex = i // Override page index
            vc.tabTitle = title // Override tab title
            vcs.append(vc)
        }

        tabsPager.contentVCs = vcs
    }
}

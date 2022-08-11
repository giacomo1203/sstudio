//
//  VideoLibraryViewController.swift
//  SoccerStudio
//
//  Created by Luis Marca on 2/07/22.
//

import TabsPager

class VideoLibraryViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var tabsPager = TabsPager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Video Library"
        
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
        
        var vcs: [ContentLibraryViewController] = []
        for (i, title) in tabs.enumerated() {
            let vc = ContentLibraryViewController()
            vc.pageIndex = i // Override page index
            vc.tabTitle = title // Override tab title
            vcs.append(vc)
        }

        tabsPager.contentVCs = vcs
    }
}

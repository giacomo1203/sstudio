//
//  LeftViewController.swift
//  SoccerStudio
//
//  Created by Luis Marca on 2/07/22.
//

import UIKit

enum LeftMenu: Int {
    case main = 0
    case coach
    case video
    case position
    case player
    case favorites
    case notifications
    case help
    case account
    case subscribe
    
}

protocol LeftMenuProtocol : AnyObject {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController : UIViewController, LeftMenuProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var menus = ["Home", "My Coach", "Library", "My Positions", "Player Perfomance", "Favorites", "Notifications", "Help", "My Account", "Subscribe for PRO account"]
    var mainViewController: UIViewController!
    var swiftViewController: UIViewController!
    var javaViewController: UIViewController!
    var goViewController: UIViewController!
    var nonMenuViewController: UIViewController!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor =  UIColor(hex: "13322A")
        
        self.tableView.separatorColor = UIColor(hex: "35856E")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let swiftViewController = storyboard.instantiateViewController(withIdentifier: "MyCoachViewController") as! MyCoachViewController
        self.swiftViewController = UINavigationController(rootViewController: swiftViewController)
        
        let javaViewController = storyboard.instantiateViewController(withIdentifier: "VideoLibraryViewController") as! VideoLibraryViewController
        self.javaViewController = UINavigationController(rootViewController: javaViewController)
        
        let goViewController = storyboard.instantiateViewController(withIdentifier: "PerfomanceViewController") as! PerfomanceViewController
        self.goViewController = UINavigationController(rootViewController: goViewController)
        
        self.tableView.registerCellClass(BaseTableViewCell.self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.layoutIfNeeded()
        
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .coach:
            self.slideMenuController()?.changeMainViewController(self.swiftViewController, close: true)
        case .video:
            self.slideMenuController()?.changeMainViewController(self.javaViewController, close: true)
        case .player:
            self.slideMenuController()?.changeMainViewController(self.goViewController, close: true)
        case .position, .favorites, .notifications, .help, .account, .subscribe:
            print("detail")
        }
    }
    
    @IBAction func onClick(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Desea cerrar sesión?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                self.navigationController?.popToRootViewController(animated: true)
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension LeftViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu {
            case .main, .coach, .video, .position, .player, .favorites, .notifications, .help, .account, .subscribe:
                return BaseTableViewCell.height()
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension LeftViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu {
            case .main, .coach, .video, .position, .player, .favorites, .notifications, .help, .account, .subscribe:
                let cell = BaseTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
                cell.setData(menus[indexPath.row])
                
                if menu == .subscribe {
                    cell.backgroundColor = UIColor(hex: "FDD800")
                    cell.textLabel?.textColor = UIColor(hex: "183E33")
                    cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                }else {
                    cell.backgroundColor =  UIColor(hex: "13322A")
                    cell.textLabel?.textColor = UIColor(hex: "FFFFFF")
                }
                
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
}

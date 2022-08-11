//
//  MenuViewController.swift
//  SoccerStudio
//
//  Created by Luis Marca on 20/07/22.
//

import UIKit

let myCoachTitle = "My Coach"
let libraryTitle = "Library"
let positionTitle = "Mi Position"
let perfomanceTitle =  "Player Perfomance"
let favoritesTitle = "Favorites"
let notificationsTitle = "Notifications"
let helpTitle = "Help"
let myAccountTitle =  "My account"
let subscribeTitle = "Subscribe for PRO account"

class MenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    var previouslyPresentedRow = 0
    
    var myCoachController: UINavigationController?
    var libraryViewController: UINavigationController?
    var perfomanceViewController: UINavigationController?
    var resultadosViewController: UINavigationController?
    var riesgosViewController: UINavigationController?
    var ubicanosViewController: UINavigationController?
    var sugerenciasViewController: UINavigationController?
    
    var menuItemTitles = [myCoachTitle, libraryTitle, positionTitle, perfomanceTitle, favoritesTitle, notificationsTitle, helpTitle, myAccountTitle, subscribeTitle]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        self.view.backgroundColor = UIColor(hex: "13322A")
    }
    
    @IBAction func onClickEvent(sender: AnyObject) {
        
        let alertController = UIAlertController(title: nil, message: "Seguro deseas salir?", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let destroyAction = UIAlertAction(title: "Salir", style: .destructive) { (action) in
            
            OperationQueue.main.addOperation({
                self.openLoginScene()
            })
        }
        
        alertController.addAction(destroyAction)
        
        self.present(alertController, animated:true, completion: nil)
    }
    
    
    func openLoginScene() {
//        let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)
//        let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        let navigationViewController = loginStoryboard.instantiateViewController(withIdentifier: "mainController") as! UINavigationController
//        navigationViewController.setViewControllers([loginViewController], animated: true)
//        self.show(navigationViewController, sender: self)
        self.dismiss(animated: true)
    }
    
    @IBAction func onClickLogin(_ sender: Any) {
        openLoginScene()
    }
    
}

extension MenuViewController: UITableViewDataSource {
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let title = menuItemTitles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath as IndexPath) as! MenuItemCell
        cell.menuItemTitle.text = title
        
        cell.selectionStyle = .none
        
        if (title == subscribeTitle) {
            cell.backgroundColor = UIColor(hex: "FDD800")
            cell.menuItemTitle.textColor = UIColor(hex: "13322A")
            cell.menuItemTitle.font = UIFont.boldSystemFont(ofSize: 18)
        }
        else {
            cell.menuItemTitle.textColor = UIColor(hex: "FFFFFF")
            cell.backgroundColor = UIColor(hex: "13322A")
        }
        
        /*
         if menu == .subscribe {
             cell.backgroundColor = UIColor(hex: "FDD800")
             cell.textLabel?.textColor = UIColor(hex: "183E33")
             cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
         }else {
             cell.backgroundColor =  UIColor(hex: "13322A")
             cell.textLabel?.textColor = UIColor(hex: "FFFFFF")
         }
         */
        
        cell.setNeedsLayout()
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.clear
        
        return vw
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let previouslyPresentedCell = tableView.cellForRow(at: NSIndexPath(row: previouslyPresentedRow, section: 0) as IndexPath)
        
        previouslyPresentedCell?.setSelected(false, animated: false)
        
        let currentCell = tableView.cellForRow(at: indexPath as IndexPath)
        currentCell!.setSelected(true, animated: false)

        var newFrontController : UIViewController!

        let title = menuItemTitles[indexPath.row]
        
        if indexPath.row == 2 ||
           indexPath.row == 4 ||
           indexPath.row == 5 ||
           indexPath.row == 6 ||
           indexPath.row == 7 ||
           indexPath.row == 8
        {
            return
        }
        
        
        //**************************************************
        // MARK: - INICIO
        //**************************************************
        
        if title == myCoachTitle {
            
            if let locationViewController = self.myCoachController {
                newFrontController = locationViewController
            }
                
            else {
                let nav = self.storyboard?.instantiateViewController(withIdentifier: "MyCoachVC") as! UINavigationController
                let locationViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyCoachViewController") as! MyCoachViewController
                nav.setViewControllers([locationViewController], animated: true)
                self.myCoachController = nav
                newFrontController = self.myCoachController
            }
        }
        
        else if title == libraryTitle {
            if let locationViewController = self.libraryViewController {
                newFrontController = locationViewController
            }
                
            else {
                let nav = self.storyboard?.instantiateViewController(withIdentifier: "VideoLibraryVC") as! UINavigationController
                let locationViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideoLibraryViewController") as! VideoLibraryViewController
                nav.setViewControllers([locationViewController], animated: true)
                self.libraryViewController = nav
                newFrontController = self.libraryViewController
            }
        }
        
        else if title == perfomanceTitle {
            if let locationViewController = self.perfomanceViewController {
                newFrontController = locationViewController
            }
                
            else {
                let nav = self.storyboard?.instantiateViewController(withIdentifier: "PerfomanceVC") as! UINavigationController
                let locationViewController = self.storyboard?.instantiateViewController(withIdentifier: "PerfomanceViewController") as! PerfomanceViewController
                nav.setViewControllers([locationViewController], animated: true)
                self.perfomanceViewController = nav
                newFrontController = self.perfomanceViewController
            }
        }

        

        revealViewController().pushFrontViewController(newFrontController, animated: true)

        previouslyPresentedRow = indexPath.row
        
    }
}




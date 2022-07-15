//
//  ContainerViewController.swift
//  SoccerStudio
//
//  Created by Luis Marca on 2/07/22.
//

import UIKit
import AVFoundation
import AVKit

class ContainerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var contentNotifications: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    
    let reuseIdentifier = "Cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3"]
    var items1 = ["4", "5", "6"]
    var items2 = ["7", "8", "9"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        contentNotifications.addGestureRecognizer(tap)
        
        let back = UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style:.plain, target: nil, action: nil)
        
        firstCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        secondCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        thirdCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        stackView.isHidden = !stackView.isHidden
        topConstraint.constant = stackView.isHidden ? 70 : 220
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView {
            return self.items.count
        }
        if collectionView == secondCollectionView {
            return self.items1.count
        }
        return self.items2.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == firstCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
            
            cell.background.image = UIImage(named: "img\(self.items[indexPath.row])")
            
            return cell
        }else if collectionView == secondCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
            
            cell.background.image = UIImage(named: "img\(self.items1[indexPath.row])")
            
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
            
            cell.background.image = UIImage(named: "img\(self.items2[indexPath.row])")
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let videoURL = URL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
}

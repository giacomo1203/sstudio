//
//  DataTableViewCell.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/8/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//

import UIKit

struct DataTableViewCellData {
    
    init(imageUrl: String, text: String) {
        self.imageUrl = imageUrl
        self.text = text
    }
    var imageUrl: String
    var text: String
}

class DataTableViewCell : BaseTableViewCell {
    
    @IBOutlet weak var dataImage: UIImageView!
    @IBOutlet weak var dataText: UILabel!
    
    override func awakeFromNib() {
        //self.dataText?.font = UIFont.italicSystemFont(ofSize: 16)
    }
 
    override class func height() -> CGFloat {
        return 110
    }
    
    override func setData(_ data: Any?) {
        if let data = data as? DataTableViewCellData {
            self.dataText.text = data.text
        }
    }
}

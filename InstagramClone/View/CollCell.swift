//
//  CollCell.swift
//  InstagramClone
//
//  Created by Piyush Sharma on 22/05/21.
//

import UIKit

class CollCell: UICollectionViewCell {
    @IBOutlet weak var storyImage: UIImageView!
    
    @IBOutlet weak var nameLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        storyImage.makeRounded()
        
    }

}

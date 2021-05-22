//
//  InstaCell.swift
//  InstagramClone
//
//  Created by Piyush Sharma on 22/05/21.
//

import UIKit

class InstaCell: UITableViewCell {

    //MARK: - IBOutlet

    @IBOutlet weak var smallImageView: UIImageView!
    
    @IBOutlet weak var mailLbl: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var largeImageView: UIImageView!
    @IBOutlet weak var streetNoLbl: UILabel!
    
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var StateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        smallImageView.makeRounded()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

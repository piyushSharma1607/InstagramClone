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

    func setCellData(data: DataViewModel, index: IndexPath) {
        let data = data.arrayListResult[index.row]
        let fullName = "\(data.name.title) \(data.name.first) \(data.name.last)"
        nameLabel.text = fullName.capitalized
       countryLbl.text = "Age: \(data.location.country)"
       mailLbl.text = "Email: \(data.email)"
        StateLabel.text = "\(data.location.state.capitalized)"
       smallImageView.downloaded(from: data.picture.thumbnail)
       largeImageView.downloaded(from: data.picture.large)
       cityLabel.text = "\(data.location.city)"
       streetNoLbl.text = "\(data.location.street.number) \(data.location.street.name)"
    }
    
    
    
    
}

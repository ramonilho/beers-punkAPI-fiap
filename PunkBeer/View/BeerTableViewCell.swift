//
//  BeerTableViewCell.swift
//  PunkBeer
//
//  Created by Ramon Honorio on 30/11/17.
//  Copyright © 2017 Ramonilho. All rights reserved.
//

import UIKit
import Kingfisher

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var alcoholLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(name: String, alcoholContent: Float, photoURL: String) {
        self.nameLabel.text = name
        self.alcoholLabel.text = "\(alcoholContent)"
        self.photoImageView.kf.setImage(with: URL(string: photoURL))
    }
}

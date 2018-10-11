//
//  CategoryHowToTableViewCell.swift
//  Aysi-MC3+
//
//  Created by Ivan Riyanto on 11/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class CategoryHowToTableViewCell: UITableViewCell {

    @IBOutlet weak var imageInCell: UIImageView!
    @IBOutlet weak var descriptionInCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

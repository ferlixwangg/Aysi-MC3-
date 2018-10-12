//
//  SiBuahHatiTableViewCell.swift
//  Aysi-MC3+
//
//  Created by Ferlix Yanto Wang on 12/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SiBuahHatiTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var iconFront: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    // MARK: - Variables
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func moreButtonPressed() {
    }
}

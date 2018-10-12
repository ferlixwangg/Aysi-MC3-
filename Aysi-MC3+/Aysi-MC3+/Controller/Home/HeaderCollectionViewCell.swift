//
//  HeaderCollectionViewCell.swift
//  Aysi-MC3+
//
//  Created by Ferlix Yanto Wang on 10/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var garisBawahImageView: UIImageView!
    
    override var isSelected: Bool {
        didSet{
            if self.isSelected {
                titleLabel.font = UIFont(name: "Nunito-Regular", size: 13)
                garisBawahImageView.isHidden = false
            } else {
                titleLabel.font = UIFont(name: "Nunito-Light", size: 13)
                garisBawahImageView.isHidden = true
            }
        }
    }
}

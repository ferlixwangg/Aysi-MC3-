//
//  AyahTauGakViewController.swift
//  Aysi-MC3+
//
//  Created by Ferlix Yanto Wang on 11/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class AyahTauGakViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Variables
    var image: UIImage? {
        didSet {
            self.imageView?.image = image
        }
    }
    
    var titleContent: String? {
        didSet {
            self.titleLabel?.text = titleContent
        }
    }
    
    var descriptionContent: String? {
        didSet {
            self.descriptionLabel?.text = descriptionContent
        }
    }
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = image
        self.titleLabel.text = titleContent
        self.descriptionLabel.text = descriptionContent
    }
}

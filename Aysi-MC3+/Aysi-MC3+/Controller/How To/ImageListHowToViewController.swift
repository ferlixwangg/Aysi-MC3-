//
//  ImageListHowToViewController.swift
//  Aysi-MC3+
//
//  Created by Ivan Riyanto on 12/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class ImageListHowToViewController: UIViewController {

    
    @IBOutlet weak var imageInListHowTo: UIImageView!
    @IBOutlet weak var labelInListHowTo: UILabel!
    
    var itemIndex : Int = 0
    var imageName: String = "" {
        didSet{
            
            if let imageView = imageInListHowTo{
                
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    var descriptionInListHowTo = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageInListHowTo.image = UIImage(named: imageName)
        labelInListHowTo.text = descriptionInListHowTo
        
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

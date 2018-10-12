//
//  ListHowToViewController.swift
//  Aysi-MC3+
//
//  Created by Ferlix Yanto Wang on 10/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class ListHowToViewController: UIViewController {
    
    @IBOutlet weak var containerViewInListHowTo: UIView!
    @IBOutlet weak var pageControllInListHowTo: UIPageControl!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let imageListHowToPageViewController = segue.destination as? ImageListHowToPageViewController {
            imageListHowToPageViewController.imageListHowToDelegate = self
        }
    }
    
//    var index : Int = 0
//    var imageHowTo : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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

extension ListHowToViewController : ImageListHowToPageViewControllerDelegate {
    func ImageListHowToPageViewController(tutorialPageViewController: ImageListHowToPageViewController, didUpdatePageCount count: Int) {
        pageControllInListHowTo.numberOfPages = count
    }
    
    func ImageListHowToPageViewController(tutorialPageViewController: ImageListHowToPageViewController, didUpdatePageIndex index: Int) {
        pageControllInListHowTo.currentPage = index
    }
    
    
    
}

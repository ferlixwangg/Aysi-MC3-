//
//  ImageListHowToPageViewController.swift
//  Aysi-MC3+
//
//  Created by Ivan Riyanto on 12/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class ImageListHowToPageViewController: UIPageViewController {

    weak var imageListHowToDelegate: ImageListHowToPageViewControllerDelegate?
    
    var imagesHowToInPageViewController = ["PijatOksitosin1","PijatOksitosin2"]
    var labelHowToInPageViewController =
        ["Minta dengan halus belahan hatimu untuk duduk dengan meja di depannya, badan condong ke depan, melipat tangan di meja, dan menyandarkan kepala di lengannya. Payudara bebas tanpa BH",
         "Pijat kedua sisi tulang belakang istri dengan menggunakan kedua jempol Anda. Tekan jempol dan buat gerakan memutar dari leher turun ke bawah sampai pertengahan punggung. Lakukan pijat ini selama 2-3 menit."]
    
    lazy var vcPengganti : [ImageListHowToViewController] = {
        return [getItemController(0),getItemController(1)]
        }() as! [ImageListHowToViewController]

    
    
    func getItemController (_ itemIndex: Int) -> ImageListHowToViewController? {
        if itemIndex < imagesHowToInPageViewController.count{
            let pageItemController = self.storyboard?.instantiateViewController(withIdentifier: "ItemController") as! ImageListHowToViewController
            
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = imagesHowToInPageViewController[itemIndex]
            pageItemController.descriptionInListHowTo = labelHowToInPageViewController[itemIndex]
            //Kalau error kemungkinan penyebabnya yang diatas
            return pageItemController
        }
        
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = self
        
        if imagesHowToInPageViewController.count > 0 {
            
            let firstController = getItemController(0)!
            let startingViewController = [firstController]
            
            setViewControllers(startingViewController, direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
            
        }
        imageListHowToDelegate?.ImageListHowToPageViewController(tutorialPageViewController: self, didUpdatePageCount: imagesHowToInPageViewController.count)
        // Do any additional setup after loading the view.
    }
}


extension ImageListHowToPageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! ImageListHowToViewController
        if itemController.itemIndex > 0 {
            return vcPengganti[itemController.itemIndex-1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! ImageListHowToViewController
        if itemController.itemIndex+1 < imagesHowToInPageViewController.count {
            return vcPengganti[itemController.itemIndex+1]
            
        }
        return nil
    }
}

extension ImageListHowToPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first as? ImageListHowToViewController,
            let index = vcPengganti.index(of: firstViewController)
        {
           imageListHowToDelegate?.ImageListHowToPageViewController(tutorialPageViewController: self, didUpdatePageIndex: index)
        }
    }
}


protocol ImageListHowToPageViewControllerDelegate: class {
    
    func ImageListHowToPageViewController(tutorialPageViewController: ImageListHowToPageViewController,didUpdatePageCount count: Int)
    
    func ImageListHowToPageViewController(tutorialPageViewController: ImageListHowToPageViewController,didUpdatePageIndex index: Int)
}

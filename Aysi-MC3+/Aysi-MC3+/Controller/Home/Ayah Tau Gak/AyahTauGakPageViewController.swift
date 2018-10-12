//
//  AyahTauGakPageViewController.swift
//  Aysi-MC3+
//
//  Created by Ferlix Yanto Wang on 11/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

protocol AyahTauGakPageViewControllerDelegate: class {
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

class AyahTauGakPageViewController: UIPageViewController {

    // MARK: - Variables
    var images : [UIImage]?
    var titleContents : [String]?
    var descriptionContents : [String]?
    var ayahTauGakDelegate: AyahTauGakPageViewControllerDelegate?
    
    struct Storyboard {
        static let AyahTauGakViewController = "AyahTauGakVC"
    }
    
    lazy var controllers : [UIViewController] = {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        var controllers = [UIViewController]()
        
        if let images = self.images {
            for image in images {
                let ayahTauGakVC = storyboard.instantiateViewController(withIdentifier: Storyboard.AyahTauGakViewController)
                controllers.append(ayahTauGakVC)
            }
        }
        
        self.ayahTauGakDelegate?.setupPageController(numberOfPages: controllers.count)
        
        return controllers
    }()
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillUpData()
        
        dataSource = self
        delegate = self
        turnToPage(index: 0)
    }
    
    func turnToPage(index: Int) {
        let controller = controllers[index]
        var direction = UIPageViewController.NavigationDirection.forward
        
        if let currentVC = viewControllers?.first {
            let currentIndex = controllers.index(of: currentVC)!
            if currentIndex > index {
                direction = .reverse
            }
        }
        
        configureDisplaying(viewController: controller)
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    
    func configureDisplaying(viewController: UIViewController) {
        for (index, vc) in controllers.enumerated() {
            if viewController === vc {
                if let ayahTauGakVC = viewController as? AyahTauGakViewController {
                    ayahTauGakVC.image = self.images?[index]
                    ayahTauGakVC.titleContent = self.titleContents?[index]
                    ayahTauGakVC.descriptionContent = self.descriptionContents?[index]
                    
                    self.ayahTauGakDelegate?.turnPageController(to: index)
                }
            }
        }
    }
    
    func fillUpData() {
        images = [UIImage(named: "Baby")!,
                  UIImage(named: "Baby2")!,
                  UIImage(named: "Baby3")!]
        titleContents = ["Si kecil udah bisa denger! nahlohh",
                         "Si kecil sekarang bisa manggil mama!",
                         "Si kecil bakalan sering ke sana sini nih"]
        descriptionContents = ["Ayah, sebaiknya sering-sering berbicara dengan si kecil agar ia senang. Untuk itu, ayah sebaiknya tidak galak yaaaaaaaaaaaa",
                               "Ayah sebaiknya mulai sering ajak si kecil ngobrol ya! Siapa tau bisa jadi temen curhat bareng",
                               "Ayo ayah udah harus mulai hati-hati nih bareng si istri! Si kecil udah mulai bisa kemana-mana jadi harus lebih diperhatiin gerak-geriknya"]
    }
}

extension AyahTauGakPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController) {
            if index > 0 {
                return controllers[index-1]
            }
        }
        
        return controllers.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index+1]
            }
        }
        
        return controllers.first
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        self.configureDisplaying(viewController: pendingViewControllers.first! as! AyahTauGakViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            self.configureDisplaying(viewController: previousViewControllers.first as! AyahTauGakViewController)
        }
    }
}

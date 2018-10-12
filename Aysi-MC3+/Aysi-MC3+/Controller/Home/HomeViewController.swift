//
//  HomeViewController.swift
//  Aysi-MC3+
//
//  Created by Ferlix Yanto Wang on 08/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlets
    
    // MARK: - Variables
    let headerCellId = ["Empty",
                        "Ayah Tau Gak?",
                        "Si Buah Hati",
                        "Si Belahan Hati",
                        "Si Kecil...",
                        "Tips",
                        "Empty2"]
    let headerCellSize = [CGSize(width: 1, height: 25),
                          CGSize(width: 98, height: 25),
                          CGSize(width: 83, height: 25),
                          CGSize(width: 100, height: 25),
                          CGSize(width: 64, height: 25),
                          CGSize(width: 35, height: 25),
                          CGSize(width: 1, height: 25)]
    var currentlyActiveHeader: IndexPath!
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTopBarDisplay()
        addUmurButton()
        setTitleUmur()
        setupNotificationCenter()
    }
    
    // MARK: - Functions
    func setupTopBarDisplay() {
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(displayP3Red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    }
    
    func addUmurButton() {
        let umurButton = UIButton(type: .custom)
        umurButton.frame = CGRect(x: 0, y: 0, width: 14, height: 14)
        umurButton.setImage(UIImage(named: "Back Button"), for: .normal)
        umurButton.setTitle(" Umur", for: .normal)
        umurButton.titleLabel?.font = UIFont(name: "Nunito-Light", size: 17)
        umurButton.setTitleColor(UIColor.init(displayP3Red: 96/255, green: 161/255, blue: 191/255, alpha: 1.0), for: .normal)
        umurButton.addTarget(self, action: #selector(HomeViewController.umurAction), for: .touchUpInside)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: umurButton)
    }

    @objc func umurAction() {
        let pilihUmurVC = self.storyboard?.instantiateViewController(withIdentifier: "pilihUmurVC") as! PilihUmurViewController
        
        let transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.pushViewController(pilihUmurVC, animated: false)
    }
    
    func setTitleUmur() {
        if Globals.currentAge == 1 {
            navigationItem.title = "Mengandung"
        } else if Globals.currentAge == 2 {
            navigationItem.title = "Minggu 1"
        } else if Globals.currentAge == 3 {
            navigationItem.title = "Minggu 2"
        } else if Globals.currentAge == 4 {
            navigationItem.title = "Minggu 3"
        } else if Globals.currentAge == 5 {
            navigationItem.title = "Minggu 4"
        } else if Globals.currentAge == 6 {
            navigationItem.title = "Bulan 2"
        } else if Globals.currentAge == 7 {
            navigationItem.title = "Bulan 3"
        } else if Globals.currentAge == 8 {
            navigationItem.title = "Bulan 4"
        } else if Globals.currentAge == 9 {
            navigationItem.title = "Bulan 5"
        } else if Globals.currentAge == 10 {
            navigationItem.title = "Bulan 6"
        }
    }
    
    @objc func gantiIUmur(notification: NSNotification) {
        setTitleUmur()
    }
    
    func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.gantiIUmur(notification:)), name: Notification.Name("gantiUmur"), object: nil)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let prevActiveCell = collectionView.cellForItem(at: currentlyActiveHeader) as! HeaderCollectionViewCell
        prevActiveCell.isSelected = false
        
        let currentlyActiveCell = collectionView.cellForItem(at: indexPath) as! HeaderCollectionViewCell
        currentlyActiveCell.isSelected = true
        currentlyActiveHeader = indexPath
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerCellId.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "headerCell", for: indexPath) as! HeaderCollectionViewCell
        cell.titleLabel.text = headerCellId[indexPath.row]
        
        if indexPath.row == 1 {
            cell.isSelected = true
            currentlyActiveHeader = indexPath
        } else {
            cell.isSelected = false
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return headerCellSize[indexPath.item]
    }
}

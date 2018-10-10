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
    let headerCellId = ["",
                        "Ayah Tau Gak?",
                        "Si Buah Hati",
                        "Si Belahan Hati",
                        "Si Kecil...",
                        "Tips"]
    
    let headerCellSize = [CGSize(width: 10, height: 25),
                          CGSize(width: 98, height: 25),
                          CGSize(width: 83, height: 25),
                          CGSize(width: 100, height: 25),
                          CGSize(width: 64, height: 25),
                          CGSize(width: 35, height: 25)]
    
    // MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addUmurButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTitleUmur()
    }
    
    // MARK: - Functions
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
        if Globals.currentAge == 0 {
            navigationItem.title = "Mengandung"
        } else if Globals.currentAge == 1 {
            navigationItem.title = "Minggu 1"
        } else if Globals.currentAge == 2 {
            navigationItem.title = "Minggu 2"
        } else if Globals.currentAge == 3 {
            navigationItem.title = "Minggu 3"
        } else if Globals.currentAge == 4 {
            navigationItem.title = "Minggu 4"
        } else if Globals.currentAge == 5 {
            navigationItem.title = "Bulan 2"
        } else if Globals.currentAge == 6 {
            navigationItem.title = "Bulan 3"
        } else if Globals.currentAge == 7 {
            navigationItem.title = "Bulan 4"
        } else if Globals.currentAge == 8 {
            navigationItem.title = "Bulan 5"
        } else if Globals.currentAge == 9 {
            navigationItem.title = "Bulan 6"
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerCellId.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

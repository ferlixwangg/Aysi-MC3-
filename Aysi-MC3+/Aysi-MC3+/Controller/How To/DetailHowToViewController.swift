//
//  DetailHowToViewController.swift
//  Aysi-MC3+
//
//  Created by Ferlix Yanto Wang on 10/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class DetailHowToViewController: UIViewController {

    var detailContent : [String] = []
    var index : Int = 0
    var clickedIndex : Int = 0
    
    @IBOutlet weak var detailContentTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension DetailHowToViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailContentTable.dequeueReusableCell(withIdentifier: "DetailHowToCell", for: indexPath) as! DetailHowToTableViewCell
        cell.contentCategoryInCell.text = detailContent[indexPath.row]
        return cell
    }
    
}

extension DetailHowToViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedIndex = indexPath.row
        performSegue(withIdentifier: "DetailToHowTo", sender: self)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? ListHowToViewController{
//         destination.index = clickedIndex
//        }
//    }
}

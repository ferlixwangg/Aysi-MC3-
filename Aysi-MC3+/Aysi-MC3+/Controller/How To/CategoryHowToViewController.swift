//
//  CategoryHowToViewController.swift
//  Aysi-MC3+
//
//  Created by Ferlix Yanto Wang on 10/10/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class CategoryHowToViewController: UIViewController {
   
    @IBOutlet weak var howToTable: UITableView!
    var clickedSection: Int = 0
    var clickedIndex: Int  = 0
    var sections : [String] = ["Istri","Anak"]
    var imageInTable = [[UIImage(named: "spa")!,UIImage(named: "spa")!],
                        [UIImage(named: "spa")!,UIImage(named: "spa")!]]
    var categoryInTable = [["Pijat","Kebersihan"],["Pijat","Kebersihan"]]
    var detailCategoryInTable = [[["Pijat Oksitosin"],[]],
                                 [["Pijat Dada","Pijat Perut","Pijat Kepala"],[]]]
//    var tutorialHowToInTable = [[[[UIImage(named: "PijatOksitosin1")!,UIImage(named: "PijatOksitosin2")!],[]],
//                                 [""]]]


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

extension CategoryHowToViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryInTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = howToTable.dequeueReusableCell(withIdentifier: "HowToCell", for: indexPath) as! CategoryHowToTableViewCell
        
        cell.imageInCell.image = imageInTable[indexPath.section][indexPath.row]
        cell.descriptionInCell.text = categoryInTable[indexPath.section][indexPath.row]
        
        return cell
    }
    
    
}
extension CategoryHowToViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Nunito-Bold", size: 17)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickedSection = indexPath.section
        clickedIndex = indexPath.row
        performSegue(withIdentifier: "CategoryToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailHowToViewController{
            destination.detailContent = detailCategoryInTable[clickedSection][clickedIndex]
            destination.index = clickedIndex
        }
    }
    
}

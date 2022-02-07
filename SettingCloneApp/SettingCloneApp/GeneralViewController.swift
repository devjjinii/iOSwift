//
//  GeneralViewController.swift
//  SettingCloneApp
//
//  Created by dev jin on 2022/02/07.
//

import UIKit

class GeneralCell: UITableViewCell {
    
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rigthImageView: UIImageView! {
        
        didSet {
            rigthImageView.image = UIImage.init(systemName: "chevron.right")
            rigthImageView.backgroundColor = .clear
            rigthImageView.tintColor = .orange
        }
    }
}

struct GeneralModel {
    var leftTitle = ""
    
}

class GeneralViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    // 이중배열
    var model = [[GeneralModel]]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 1section : 1
        // 2section : 6
        // 3section : 1
        return model[section].count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath) as! GeneralCell
        
        cell.leftLabel.text = model[indexPath.section][indexPath.row].leftTitle
        
        return cell
        
    }
    
    
    @IBOutlet weak var generalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "General"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        generalTableView.delegate = self
        generalTableView.dataSource = self
        generalTableView.backgroundColor = UIColor(white: 243/255, alpha: 1)
        
        model.append([GeneralModel(leftTitle: "About")])
        
        model.append([GeneralModel(leftTitle: "Keyboard"),
        GeneralModel(leftTitle: "Game Controller"),
        GeneralModel(leftTitle: "Fonts"),
        GeneralModel(leftTitle: "Language & Region"),
        GeneralModel(leftTitle: "Dictionary")])
        
        model.append([GeneralModel(leftTitle: "Reset")])
    }


}

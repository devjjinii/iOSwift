//
//  ViewController.swift
//  SettingCloneApp
//
//  Created by dev jin on 2022/02/04.
//

import UIKit

class ViewController: UIViewController {

    var settingModel = [[SettingModel]]()

    @IBOutlet weak var settingTableView: UITableView!
   
    func makeData() {
        settingModel.append(
            [SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to your iPhone", subTitle: "Set up iCloud, the App Store", rightImageName: nil)]
        )
        
        settingModel.append(
            [SettingModel(leftImageName: "gear", menuTitle: "General", subTitle: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "person.fill", menuTitle: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
             SettingModel(leftImageName: "hand.raised.fill", menuTitle:  "Privacy", subTitle: nil, rightImageName: "chevron.right")]
        )
    }
    
    // 처음 실행(셋팅)되는 부분
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.backgroundColor = UIColor(white: 243/255, alpha: 1)
        
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        makeData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return somedata.count

        return settingModel[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 첫번째 로우
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
            as! ProfileCell
            
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
     
            cell.profileImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.leftImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
        
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
       
        cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "")
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        
        return 60
    }
    
}


//
//  Akaunto.swift
//  omisenokonnzatujouhou
//
//  Created by cl_umeda_003 on 2022/03/09.
//

import UIKit

class Akaunto: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    var infomationNameArray = [[String]]()
    
    var sectionNameArray = [String]()
    
        override func viewDidLoad() {
        super.viewDidLoad()
            
            
            myTableView.dataSource = self
            
            myTableView.delegate = self
            
            
            infomationNameArray = [["お知らせ"], ["閲覧履歴"], ["会員情報変更", "アプリ設定"], ["ログアウト"]]
            
            sectionNameArray = ["インフォメーション", "履歴", "設定", "その他"]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
      //  if section == 3 {
        //    return 2
       // } else {
         //   return 1
       // }
        
        return infomationNameArray[section].count
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNameArray.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath)
        
        cell.textLabel?.text = infomationNameArray[indexPath.section][indexPath.row]
        
        //if section == 2{
          //  return
        //}
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(infomationNameArray[indexPath.row])が選ばれました!")
        if indexPath.section == 0 && indexPath.row == 0 {
            performSegue(withIdentifier: "showDetailSegue", sender: nil)
        } else if indexPath.section == 1 && indexPath.row == 0 {
            performSegue(withIdentifier: "showDetailSegue2", sender: nil)
        }else if indexPath.section == 2 && indexPath.row == 0 {
            performSegue(withIdentifier: "showDetailSegue3", sender: nil)
        }else if indexPath.section == 2 && indexPath.row == 1 {
            performSegue(withIdentifier: "showDetailSegue4", sender: nil)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return sectionNameArray[section]
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
    
    
    
  //  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        performSegue(withIdentifier: "showDetailSegue", sender: nil)
    //}
    
    
}

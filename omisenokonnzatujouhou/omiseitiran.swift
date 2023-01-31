//
//  omiseitiran.swift
//  omisenokonnzatujouhou
//
//  Created by clark on 2022/06/21.
//



import UIKit

class omiseitiran: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var itiranTableView: UITableView!
    
    //配列fruitsを設定
    var infomationArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        itiranTableView.delegate = self
        
        itiranTableView.dataSource = self
        
        
        
        infomationArray = ["name", "img", "infomation"]
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infomationArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itiranTableView.dequeueReusableCell(withIdentifier: "omiseitiranncell", for: indexPath)
        
        cell.textLabel?.text = infomationArray[indexPath.row]
        
        
        //if section == 2{
        //  return
        //}
        
        return cell
    }
    
    
    
}


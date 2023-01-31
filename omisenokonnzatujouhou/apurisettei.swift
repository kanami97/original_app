//
//  apurisettei.swift
//  omisenokonnzatujouhou
//
//  Created by cl_umeda_003 on 2022/03/16.
//

import UIKit

class apurisettei: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("\(rowNameArray[indexPath.row])が選ばれました!")
    self.performSegue(withIdentifier: "kyuusekinyuuryoku", sender: nil)
    }
    
}

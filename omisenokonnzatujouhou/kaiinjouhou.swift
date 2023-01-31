//
//  kaiinjouhou.swift
//  omisenokonnzatujouhou
//
//  Created by cl_umeda_003 on 2022/03/16.
//

import UIKit

class kaiinjouhou: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var table: UITableView!
    
    //@IBAction func tappedButton(_ sender: Any) {
      // UIAlertControllerの生成
      //let alert = UIAlertController(title: "アカウント切り替え", message: "店舗側のアカウントに切り替えますか", preferredStyle: .alert)

      // アクションの生成
      //let yesAction = UIAlertAction(title: "はい", style: .default) { action in
        //  print("tapped yes")
      //}

     // let noAction = UIAlertAction(title: "いいえ", style: .destructive) { action in
       //   print("tapped no")
      //}

      //let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { action in
        //  print("tapped cancel")
      //}

      // アクションの追加
      //alert.addAction(yesAction)
      //alert.addAction(noAction)
      //alert.addAction(cancelAction)

      // UIAlertControllerの表示
      //present(alert, animated: true, completion: nil)
    //}
    
    var rowNameArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        table.delegate = self
        
        rowNameArray = ["店舗側アカウントに変更"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kaiinjouhoucell")
        
        cell?.textLabel?.text = rowNameArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(rowNameArray[indexPath.row])が選ばれました!")
        
        // UIAlertControllerの生成
        let alert = UIAlertController(title: "アカウント切り替え", message: "店舗側のアカウントに切り替えますか", preferredStyle: .alert)

        // アクションの生成
        let yesAction = UIAlertAction(title: "はい", style: .default) { action in
            print("tapped yes")
            
            
            //アラートが消えるのと画面が移動するのが被らないように０.５秒後に画面遷移が行われる
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                //０.５秒後に処理したい情報
                self.performSegue(withIdentifier: "itirannikou", sender: nil)
            }
        }

        //let noAction = UIAlertAction(title: "いいえ", style: .destructive) { action in
            //print("tapped no")
        //}

        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { action in
            print("tapped cancel")
            //performSegue(withIdentifier: "tenpogawaSegue", sender: nil)
        }

        // アクションの追加
        alert.addAction(yesAction)
        //alert.addAction(noAction)
        alert.addAction(cancelAction)

        // UIAlertControllerの表示
        present(alert, animated: true, completion: nil)
        
        
      }
      
    
}

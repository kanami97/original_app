//
//  kennsaku.swift
//  omisenokonnzatujouhou
//
//  Created by clark on 2022/05/11.
//

import UIKit
import MapKit
import Firebase

class kennsaku: UIViewController, UISearchBarDelegate{
    
    @IBOutlet weak var searchText: UISearchBar!
    @IBOutlet weak var dispMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Text Fildのdelegate通知先を設定
        searchText.delegate = self
        
        //入力のヒントになる、プレースホルダーを設定
        searchText.placeholder = "キーワードを入力してください"
        
        firestore()
    }
    
    
    
    // textField.rightViewMode = UITextFieldViewMode.Always
    //let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    //let image = UIImage(named: imageName)
    //imageView.image = image
    //textField.rightView = imageView
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("b")
        //キーボードを閉じる１
        view.endEditing(true)
        
        //検索条件
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBar.text
        
        //入力された文字を取り出す２
        if let searchKey = searchBar.text {
            //入力された文字をデバッグエリアに表示する３
            print(searchKey)
            
            searchtennmei(keyword: searchKey)
            
            let geocoder = CLGeocoder()
            
            
            
            //入力された文字から位置情報を取得６
          //  geocoder.geocodeAddressString(searchKey , completionHandler: { (placemarks,error) in
                
                //位置情報が存在する場合はunwrapPlacemarksに取り出す７
            //    if let unwrapPlacemarks = placemarks {
                    
                    //１件目の情報を取り出す８
              //      if let firstPlacemark = unwrapPlacemarks.first {
                        
                        //位置情報を取り出す9
                //        if let location = firstPlacemark.location {
                            
                            //位置情報から緯度経度をtaragetCoordinateに取り出す１０
                  //          let targetCoordinate = location.coordinate
                            
                            //緯度経度をデバッグエリアに表示１１
                    //        print(targetCoordinate)
                            
                            
                            //ローカル検索を実行する
                            let localSearch:MKLocalSearch = MKLocalSearch(request: request)
                            localSearch.start(completionHandler: {(result, error) in
                                
                                for placemark in (result?.mapItems)! {
                                    if(error == nil)  {

                                        //MKPointAnnotationインスタスを取得、ピンを生成１２
                                        let pin = MKPointAnnotation()

                                        //ピンを置く場所に緯度経度を設定１３
                                        pin.coordinate = CLLocationCoordinate2DMake(placemark.placemark.coordinate.latitude, placemark.placemark.coordinate.longitude)

                                        //ピンのタイトルを設定14
                                        pin.title = placemark.placemark.name

                                        //ピンを地図に置く１５
                                        self.dispMap.addAnnotation(pin)

                                    } else {
                                        //エラー
                                        print(error)
                                    }

                                }
                            })
                            
                            
                            //緯度経度を中心にして半径５００mの範囲を表示１６
                          //  self.dispMap.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
                        }
                    }
    
    //searchtennmeiメソッド
    //第一引用：keyword 検索したいワード
    func searchtennmei(keyword : String){
        //店名の検索キーワードをURLエンコードする
//        guard keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) != nil else {
//            return
//        }
        
        //リクエストURLの組み立て
        guard let req_url = URL(string:"http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=6a75701417067879&format=json&keyword=\(keyword.urlEncoded)") else {
            return
        }
        print(req_url)
    

    
    //リクエストに必要な情報を生成
    let req = URLRequest(url: req_url)
    
    //データ転送を管理するためのセッションを生成
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    //リクエストをタスクとして登録
    let task = session.dataTask(with: req, completionHandler: {
        (date , response , error) in
        //セッションを終了
        session.finishTasksAndInvalidate()
        //do try catch　エラーハンドリング
        do {
            //jsondecoderのインスタンス取得
            let decoder = JSONDecoder()
            //受け取ったJSONデータをバース（解析）して格納
            let json = try decoder.decode(ResultJson.self, from: date!)
            
            print(json)
            
        }catch {
            //エラー処理
            print("エラーが出ました")
        }
    })
    //ダウンロード開始
    task.resume()
    
    }
                

        
        //デフォルト動作を行うのでtureを返す４
        //return true
        

    
    


}


//JSONのITEM内のデータ構造
struct results_available {
    
}

struct results_start {
    
}

struct ShopResultJson: Codable {
    let shop:[ShopJson]?
}

struct ShopJson: Codable {
    //お店の名前
    let name: String?
    
    //お店の名前のかな
    let name_kana: String?
    
    //住所
    let address: String?
    
    //最寄駅
    let station_name: String?
    
    //料金備考
    let budget_memo: String?
    
    //お店のキャッチ
    let catch1: String?
    
    //総席数
    let capacity: String?
    
    //交通アクセス
    let access: String?
    
    //携帯交通アクセス
    let mobile_access: String?
    
    //店名URL
    let urls: URL?
    
    //営業時間
    let open: String?
    
    //定休日
    let close: String?
    
    //コース
    let course: String?
    
    //飲み放題
    let free_drink: String?
    
    //食べ放題
    let free_food: String?
    
    //個室
    let private_room: String?
    
    //ランチ
    let lunch: String?
    
    
    
}

struct Middle_area: Codable {
    
    //中エリアの店名
    let name: String?
    
}

struct small_area: Codable{
    
    //小エリアの店名
    let name: String?
}

struct genre: Codable {
    
    //お店ジャンル名
    let name: String?
    
    //お店のジャンルキャッチ
    let catch2: String?
                
}

struct sub_genre: Codable {
    
    //お店のサブジャンル名
    let name: String?
    
}

struct budget: Codable {
    
    //検索ディナー予算
    let name: String?
    
    //平均ディナー予算
    let average: String?
    
    
}

struct ResultJson: Codable {
    
    let special:[SpecialJson]?
    
}

struct SpecialJson: Codable {
    
    //特集名
    let name: String?
    
    //タイトル
    let title: String?
    
}

struct special_category: Codable {
    
    //特集カテゴリー名
    let name: String?
    
}


extension kennsaku {
   
    func firestore() {
        print("a")
        let db = Firestore.firestore()
        
        
        db.collection("mise").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                            
                            let annotation = MKPointAnnotation()
                            
//                            let latitude = 35.72949166949532
//                            let longitude = 139.77815044444452
                            let aki = document["aki"]! as! Bool
                            if aki {
                            let  longitude = document["longitude"]! as! String
                            let latitude = document["latitude"]! as! String
                            annotation.title = document["name"]! as! String
                           // annotation.subtitle = "テストサブタイトル"
                            
                            annotation.coordinate = CLLocationCoordinate2DMake(Double(latitude)!, Double(longitude)! )
                            }
                            self.dispMap.addAnnotation(annotation)
                        }
                        
                    }
                }
            }
//        db.collection("misenojouhou").getDocuments()
//            .addSnapshotListener { documentSnapshot, error in
//              guard let document = documentSnapshot else {
//                print("Error fetching document: \(error!)")
//                return
//              }
//              guard let data = document.data() else {
//                print("Document data was empty.")
//                return
//              }
//              print("Current data: \(data)")
//            }
//    }
//}
}

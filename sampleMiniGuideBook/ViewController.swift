//
//  ViewController.swift
//  sampleMiniGuideBook
//
//  Created by 安井春輝 on 2017/06/19.
//  Copyright © 2017 haruki yasui. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        //プロパティリストファイルパスを取得
        let filePath = Bundle.main.path(forResource: "placelist", ofType: "plist")
        //プロパティリストからdataを取得（dictionary型）
        let dic = NSDictionary(contentsOfFile: filePath!)
        
        //TableViewで扱いやすい配列（エリア名の入っている配列）を作成
            //高速列挙(for文)で値を取得
        for (key,data) in dic! {
//            print("KEY=\(key)")
//            print("DATA=\(data)")
            placeList.append(key as! String)
            
        }
        
        
        //printで配列の中身を確認（念のため）
        print(placeList)
        
        
    }
    
    var selectedPlace:String = ""

//    var stores = ["Ayala", "Moalboal"]
    
    //プロパティリストから読み込んだデータを格納する配列
    //[String] -> 中身がString型のデータが入っている配列
    var placeList:[String] = []
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = placeList[indexPath.row]
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
    
    //セルをタップした時、セグエを指定して画面遷移
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //表示されているエリア名をメンバ変数に格納
        selectedPlace = placeList[indexPath.row]
        
        //セグエを指定して画面遷移
        self.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    
    //次の画面へ移動する時にプロパティに選択したエリア名を渡す
    //セグエを使って別な画面に移動する時に発動
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //移動先の画面のインスタンスを作成(destinationは行き先という意味)
        let svc = segue.destination as! SecondViewController
        
        //移動先の画面のプロパティにエリア名を指定
        svc.areaName = selectedPlace
        
//        dvc.myLabel.text = selectName
//        ↑考え方はいいが、エラーが起きる。理由としては部品がインスタンス化されるタイミングは画面が表示されてからなのでエラーになる
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


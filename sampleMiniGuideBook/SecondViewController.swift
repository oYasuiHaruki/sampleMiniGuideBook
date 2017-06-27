//
//  SecondViewController.swift
//  sampleMiniGuideBook
//
//  Created by 安井春輝 on 2017/06/19.
//  Copyright © 2017 haruki yasui. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {

    
    var areaName = ""
    
    @IBOutlet weak var myMapView: MKMapView!
    
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var myUITextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        
        //プロパティリストファイルパスを取得
        let filePath = Bundle.main.path(forResource: "placelist", ofType: "plist")
        
        //プロパティリストからdataを取得（dictionary型）
        let dic = NSDictionary(contentsOfFile: filePath!)
        
        //指定されたエリア名をキーにして、画面に必要な情報を取得
        let detailInfo:NSDictionary = dic![areaName] as! NSDictionary
//            as! NSDictionary
        print(dic)
        
        print(detailInfo["image"]!)
        print(detailInfo["description"] as! String)
        
        myImageView.image = UIImage(named: detailInfo["image"] as! String)
        
        myUITextView.text = detailInfo["description"] as! String
        
        print(detailInfo)
        
        
//        var a = Double(detailInfo["latitude"] as! String)
//        
//        var b = Double(detailInfo["longitude"] as! String)
        
        //中心となる場所の座標オブジェクトを作成
        //アヤラ
        let coodinate = CLLocationCoordinate2DMake((Double(detailInfo["latitude"] as! String))!,(Double(detailInfo["longitude"] as! String)!))
        
        //上記はMapkitに書かれている関数
        
        //縮尺を設定
        let span = MKCoordinateSpanMake(0.1, 0.1)
        
        //範囲オブジェクトを作成
        let region = MKCoordinateRegionMake(coodinate, span)
        
        //MapViewに範囲オブジェクトを設定
        myMapView.setRegion(region, animated: true)
        
        
        //アヤラにピンを立てる
        //1.ピンを生成
        let myPin = MKPointAnnotation()
        
        //2.ピンの座標を設定する
        myPin.coordinate = coodinate
        //        myPin.coordinate = CLLocationCoordinate2DMake(10.317347, 123.905759)
        //3.タイトル、サブタイトルを設定
//        myPin.title = "アヤラ"
        myPin.subtitle = "おすすめ"
        //4.mapViewにピンを追加
        myMapView.addAnnotation(myPin)
        
        
        
        
        
        
        

        
        
        
        
        //navigationBarのtitleを編集
        navigationTitle.title = areaName
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

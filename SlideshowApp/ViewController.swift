//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 許 裕士 on 2019/04/12.
//  Copyright © 2019 許 裕士. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var swicth: UIButton!
    
    var dispImageNo = 0
    
    @IBAction func push(_ sender: Any) {
        if timer == nil {
            // タイマーが動いていない
            button.isEnabled = true
            nextpage()
        }
        else {
            button.isEnabled = false
        }
        button.isEnabled = true
    }
    
    @IBAction func back(_ sender: Any) {
        
        if timer == nil {
            // タイマーが動いていない
            button.isEnabled = true
            //表示している画像の番号を1減らす
            dispImageNo -= 1
            
            //表示している画像の番号を元に画像を表示する
            displayImage()
        }
        else {
            button.isEnabled = false
        }
        button.isEnabled = true
    }
    
    //表示している画像の番号を元に画像を表示する
    func displayImage(){
        //画像の名前の配列
        let imageNameArray = [
        "one", "two", "three"
        ]
        
        //画像の番号が正常な範囲を指しているかチェック
        
        //範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        //範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        //表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        //画像の読み込み
        let image = UIImage(named: name)
        
        //Image viewに読み込んだ画像をセット
        image1.image = image
    }
    
//    @objc func updateTimer(_ timer: Timer) {
//        let imageNameArray = [
//            "one", "two", "three"
//        ]
//                let name = imageNameArray[dispImageNo]
//                let image = UIImage(named: name)
//                image1.image = image
//        dispImageNo += 1
//        if dispImageNo > 2 {
//            dispImageNo = 0
//        }
//    }
    
   @objc func nextpage(){
        //表示している画像の番号を1増やす
        dispImageNo += 1
        
        //表示している画像の番号を元に画像を表示する
        displayImage()
    }
    //タイマー用のやつ
    var timer: Timer!
    
    func onUpdate(){
        timer = Timer.scheduledTimer(timeInterval: 2.0, target:self,selector: #selector(nextpage),userInfo:nil,repeats:true)
    }
    
//    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    
    @IBAction func suraido(_ sender: Any) {
        if timer == nil {
            // タイマーが動いていない
            onUpdate()
            swicth.setTitle("停止", for: .normal)
        }
        else {
            // タイマーが動いていている
            timer?.invalidate()
            timer = nil
            swicth.setTitle("再生", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "one")
        image1.image = image
    }

    //遷移先に大きく画像を出す為の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        //画像の名前の配列
        let imageNameArray = [
            "one", "two", "three"
        ]
        
        //表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        //画像の読み込み
        //let image = UIImage(named: name)
        
        resultViewController.hoge = name
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

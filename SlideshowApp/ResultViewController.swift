//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 許 裕士 on 2019/04/12.
//  Copyright © 2019 許 裕士. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bigimage: UIImageView!
    
    var hoge: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //let result = hoge
        
        //画像の読み込み
        let image = UIImage(named: hoge)
        bigimage.image = image
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

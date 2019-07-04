//
//  ViewController.swift
//  df-extension-ios
//
//  Created by pikachu987 on 01/07/2019.
//  Copyright (c) 2019 pikachu987. All rights reserved.
//

import UIKit
import df_extension_ios

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let test1 = "http://www.naver.com"
        let test2 = "https://www.naver.com"
        let test3 = "pikachu987@naver.com"
        let test4 = "pikachu987@naver"
        print("1: \(test1.isValidUrl)")
        print("2: \(test2.isValidUrl)")
        print("3: \(test3.isValidUrl)")
        print("4: \(test4.isValidUrl)")
        let test5 = "가나다라마바다사아자아다sdjkfsjsdfj"
        let test6 = "나다라마"
        let test7 = "다sd"
        let test8 = "jsd"
        print(test5.nsRange(test6)!)
        print(test5.nsRange(test7)!)
        print(test5.nsRange(test8)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//1: true
//2: true
//3: true
//4: false
//Optional({3, 12})
//Optional({33, 5})
//Optional({42, 3})

//
//  ReactNativeViewController.swift
//  abyss
//
//  Created by 任超 on 2018/3/1.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import UIKit
import React

class ReactNativeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initReactNativeView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initReactNativeView() {
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
        let mockData:NSDictionary = ["scores":
            [
                ["name":"Alex", "value":"42"],
                ["name":"Joel", "value":"10"]
            ]
        ]
        
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "AReactNative",
            initialProperties: mockData as [NSObject : AnyObject],
            launchOptions: nil
        )
        
        self.view = rootView
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

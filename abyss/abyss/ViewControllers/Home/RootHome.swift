//
//  RootHome.swift
//  abyss
//
//  Created by 任超 on 2018/3/1.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import UIKit

class RootHome: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /**
         Websocket
         */
        AppWebSocket.shared.connect()
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
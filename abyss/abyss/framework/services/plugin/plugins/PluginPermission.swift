//
//  PluginDebug.swift
//  zgxlSwift
//
//  Created by 任超 on 2018/1/18.
//  Copyright © 2018年 Chongqing Xilian Technology Development Co., Ltd. All rights reserved.
//

import Foundation
import UIKit
import arek
import RxSwift

final class PluginPermission: PluginService {
    let usedPermission : [ArekPermissionProtocol] = [ArekPhoto(),ArekCamera(),ArekLocationAlways(),ArekNotifications()]
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
    {
        Log("🛰 Permission(权限管理器) Report")
        usedPermission.forEach {
            let permission = $0
            $0.status { (status) in
                switch status {
                case .authorized:
                    Log("✅\(permission)")
                case .denied:
                    Log("⛔️\(permission)")
                case .notDetermined:
                    Log("🤔\(permission)")
                case .notAvailable:
                    Log("🚫\(permission)")
                }
            }
        }
    }
}


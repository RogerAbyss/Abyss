//
//  PluginDebug.swift
//  zgxlSwift
//
//  Created by 任超 on 2018/1/18.
//  Copyright © 2018年 Chongqing Xilian Technology Development Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

#if DEBUG
import FLEX
import GDPerformanceView
    /**
     scheme中 设置``DYLD_PRINT_STATISTICS``
     监控启动时间
    */
#endif

final class PluginDebug: PluginService {
    #if DEBUG
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
    {
        Log("🛰 FLEX(内置测试器) Running")
        FLEXManager.shared().showExplorer()
        
        Log("🛰 GDPerformanceView(性能监控器) Running")
        GDPerformanceMonitor.sharedInstance.startMonitoring()
    }
    #endif
}


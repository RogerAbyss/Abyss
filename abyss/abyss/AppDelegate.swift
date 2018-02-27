//
//  AppDelegate.swift
//  abyss
//
//  Created by 任超 on 2018/2/25.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        AppGlobalManager.pluginServices().plugins()
            .forEach{ ($0.application(application, didFinishLaunchingWithOptions: launchOptions)) }
        
        /**
         Weex模块
         资源更新方案
        */
        Weex.setup()
        
        /**
         Fabric模块
         Crashlytics & Answer
         崩溃日志
         App分析
         */
        Fabric.with([Crashlytics.self])
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        AppGlobalManager.pluginServices().plugins() .forEach { ($0.applicationWillResignActive(application))}
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        AppGlobalManager.pluginServices().plugins() .forEach { ($0.applicationDidEnterBackground(application))}
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        AppGlobalManager.pluginServices().plugins() .forEach { ($0.applicationWillEnterForeground(application))}
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        AppGlobalManager.pluginServices().plugins() .forEach { ($0.applicationDidBecomeActive(application))}
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        AppGlobalManager.pluginServices().plugins() .forEach { ($0.applicationWillTerminate(application))}
    }
}


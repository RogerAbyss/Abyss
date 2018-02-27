//
//  AppInfo.swift
//  zgxlSwift
//
//  Created by 任超 on 2018/1/23.
//  Copyright © 2018年 Chongqing Xilian Technology Development Co., Ltd. All rights reserved.
//

import Foundation
import UIKit.UIDevice

struct AppInfo : Codable {
    static let infoDictionary = Bundle.main.infoDictionary
    static let appDisplayName: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String //App 名称
    static let bundleIdentifier:String = Bundle.main.bundleIdentifier! // Bundle Identifier
    static let appVersion:String = Bundle.main.infoDictionary! ["CFBundleShortVersionString"] as! String// App 版本号
    static let buildVersion : String = Bundle.main.infoDictionary! ["CFBundleVersion"] as! String //Bulid 版本号
    static let iOSVersion:String = UIDevice.current.systemVersion //ios 版本
    static let identifierNumber = UIDevice.current.identifierForVendor //设备 udid
    static let systemName = UIDevice.current.systemName //设备名称
    static let model = UIDevice.current.model // 设备型号
    static let localizedModel = UIDevice.current.localizedModel  //设备区域化型号
}

//
//  ZgxlGlobal.swift
//  zgxlSwift
//
//  Created by 任超 on 2018/1/17.
//  Copyright © 2018年 Chongqing Xilian Technology Development Co., Ltd. All rights reserved.
//

import Foundation

/**
 # App全局配置
 
 配置各种全局参数
 <br>
 
 - ATS 使用http请求
 
 ```
 <key>NSAppTransportSecurity</key>
 <dict>
 <key>NSAllowsArbitraryLoads</key>
 <true/>
 </dict>
 ```
 
 - Permission 权限请求
 
 ```
 <!-- 相册 -->
 <key>NSPhotoLibraryUsageDescription</key>
 <string>App需要您的同意,才能访问相册</string>
 <!-- 相机 -->
 <key>NSCameraUsageDescription</key>
 <string>App需要您的同意,才能访问相机</string>
 <!-- 麦克风 -->
 <key>NSMicrophoneUsageDescription</key>
 <string>App需要您的同意,才能访问麦克风</string>
 <!-- 位置 -->
 <key>NSLocationUsageDescription</key>
 <string>App需要您的同意,才能访问位置</string>
 <!-- 在使用期间访问位置 -->
 <key>NSLocationWhenInUseUsageDescription</key>
 <string>App需要您的同意,才能在使用期间访问位置</string>
 <!-- 始终访问位置 -->
 <key>NSLocationAlwaysUsageDescription</key>
 <string>App需要您的同意,才能始终访问位置</string>
 <!-- 日历 -->
 <key>NSCalendarsUsageDescription</key>
 <string>App需要您的同意,才能访问日历</string>
 <!-- 提醒事项 -->
 <key>NSRemindersUsageDescription</key>
 <string>App需要您的同意,才能访问提醒事项</string>
 <!-- 运动与健身 -->
 <key>NSMotionUsageDescription</key> <string>App需要您的同意,才能访问运动与健身</string>
 <!-- 健康更新 -->
 <key>NSHealthUpdateUsageDescription</key>
 <string>App需要您的同意,才能访问健康更新 </string>
 <!-- 健康分享 -->
 <key>NSHealthShareUsageDescription</key>
 <string>App需要您的同意,才能访问健康分享</string>
 <!-- 蓝牙 -->
 <key>NSBluetoothPeripheralUsageDescription</key>
 <string>App需要您的同意,才能访问蓝牙</string>
 <!-- 媒体资料库 -->
 <key>NSAppleMusicUsageDescription</key>  <string>App需要您的同意,才能访问媒体资料库</string>
 ```
 */
open class AppGlobalConfiguration {
    /**
     ## Net(网络相关)
     <br>
     - host(域名)
     - publicHeader(公共头文件)
     - timeout(超时时间)
    */
    public class Net {
        /**
         ### host
         域名 [String]
         管理多域名
         */
        class func host() -> [String] {
            return ["http://www.sxt369.com",
                    "http://www.zgxl168.com"]
        }
        
        class func websocket() -> [(host: String,port: String)] {
            return [("192.168.3.25","9999")]
        }
        
        /**
         ### publicHeader
         公共头文件 [String : String]
         platform=iOS 平台
         version={version} 版本号, 如1.0.0
         */
        class func publicHeader() -> [String : String] {
            return ["platform" : "iOS",
                    "version" : AppInfo.appVersion]
        }
        
        /**
         ### timeout
         超时时间 TimeInterval
         公共:60秒超时时间
         */
        class func timeout() -> TimeInterval {
            return TimeInterval(60)
        }
    }
    
    /**
     ## Security(安全相关)
     <br>
     略
     */
    public class Security {
        /**
         ### rsa_public_key
         rsa公钥
         */
        class func rsa_public_key() -> String {
            return "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCtxvV5eVFgIJ0gWFL/hefuIHxJ3BcBTaOub+DgI8XRaNNW7Bcam2O9OV3Jbi/nTVrX0G6oKrvcksq+iXjgmz7ZuncJNCke+TzkT9CYFCmnUg8IdNFdAQw2TdO8/oKkqB3KnFCFWfZpcp58WPscpDDUT8YL1xU56vl/IZrPouxRSwIDAQAB"
        }
        
        /**
         ### md5_sign
         md5混合
         */
        class func md5_sign() -> String {
            return "ZGXL168"
        }
    }
}

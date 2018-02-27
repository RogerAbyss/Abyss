//
//  WeexBundler.swift
//  zgxlSwift
//
//  Created by 任超 on 2018/2/25.
//  Copyright © 2018年 Chongqing Xilian Technology Development Co., Ltd. All rights reserved.
//

import Foundation
import Alamofire

/** 通知 */
let NotificationSignWeexBundlerDownloadComplete = "WeexBundlerDownloadComplete"

class WeexBundler {
    
    /**
     服务器JSBundle的地址
     */
    static let bundleUrl = "http://192.168.2.2:8081/dist/index.js"
    
    /**
     开关
     是否从远程服务器加载
     如果否, 会使用本地的bundlejs
     默认: 是
     */
    static var needUpdate = true
    
    /**
     pathOfJSBundle
     获取本地jsbundle路径
     本地没有缓存 则 取本地数据
    */
    class func pathOfJSBundle() -> URL!
    {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("bundlejs/index.js")

        if FileManager.default.fileExists(atPath: fileURL.absoluteString) {
            return fileURL
        } else {
            return Bundle.main.url(forResource: "index", withExtension: "js")
        }
    }
    
    /**
     从服务器下载
    */
    class func download() {
        Log("💙 更新JSBundle...")
        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            return (WeexBundler.pathOfJSBundle(), [.removePreviousFile, .createIntermediateDirectories])
        }

        
        Alamofire.download(WeexBundler.bundleUrl, to: destination).responseData { response in
            
            if response.result.isSuccess {
                Log("💙 成功下载JSBundle")
            } else {
                Log("💙 请确认服务器已经打开")
                /**
                 服务器没有开吧
                */
                WeexBundler.needUpdate = false
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationSignWeexBundlerDownloadComplete),
                                            object: nil)
            
            }.downloadProgress { progress in
                print("💙 当前进度：\(progress.fractionCompleted*100)%")
        }
    }
    
    /**
     是否需要更新
     根据是否有本地缓存数据
     根据是否远程可访问
     调用本地 或者 本地缓存数据
     */
    class func doNeedUpdate() -> Bool {
        return WeexBundler.needUpdate
    }
}

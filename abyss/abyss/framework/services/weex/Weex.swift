//
//  Weex.swift
//  abyss
//
//  Created by 任超 on 2018/2/26.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import Foundation
import WeexSDK

/**
 Weex
 use 💙 to filter console info
 继承于Weex的UIViewController可以实现Weex
 */
class Weex: UIViewController {
    var instance: WXSDKInstance?
    var weexView = UIView()
    var weexHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instance = WXSDKInstance()
        instance?.viewController = self
        instance?.frame = view.frame
        // Do any additional setup after loading the view.
        
        weak var weakSelf: Weex? = self
        instance!.onCreate = {
            (view:UIView!)-> Void in
            
            weakSelf?.weexView .removeFromSuperview()
            weakSelf?.weexView = view
            weakSelf?.view.addSubview(weakSelf!.weexView)
        }
        
        if instance != nil {
            Log("💙 Weex ")
        }
        instance!.onFailed = {
            (error:Error!)-> Void in
            
            Log("💙 Failed\(error)")
        }
        
        instance!.renderFinish = {
            (view:UIView!)-> Void in
            
            Log("💙 renderFinish")
        }
        
        instance!.updateFinish = {
            (view:UIView!)-> Void in
            
            Log("💙 updateFinish")
        }
        
        if let url = WeexBundler.pathOfJSBundle() {
            instance?.render(with: url, options: ["bundleUrl" : url.absoluteString], data: nil)
        }
    }
    
    
    deinit {
        instance?.destroy()
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - 内存优化处理
extension Weex {
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - 初始化
extension Weex {
    /**
     初始化
     */
    class func setup() {
        WXAppConfiguration.setAppGroup("zgxl")
        WXAppConfiguration.setAppName("zgxl")
        WXAppConfiguration.setAppVersion("1.0.0")
        
        WXSDKEngine.initSDKEnvironment()
        
        /**
         注册图片下载协议
        */
        WXSDKEngine.registerHandler(WeexImgLoader(), with: WXImgLoaderProtocol.self)
        
        #if DEBUG
            WXLog.setLogLevel(WXLogLevel.warning)
        #else
            WXLog.setLogLevel(WXLogLevel.error)
        #endif
        
        WeexBundler.download()
    }
}

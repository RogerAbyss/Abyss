//
//  WeexImgLoader.swift
//  abyss
//
//  Created by 任超 on 2018/2/28.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import Foundation
import WeexSDK
import Kingfisher

/**
 实现WXImageOperationProtocol协议的cancel
 */
class WXImageOperation: NSObject, WXImageOperationProtocol {
    var task: RetrieveImageTask?
    init(task: RetrieveImageTask?) {
        self.task = task
    }

    func cancel() {
        task?.cancel()
    }
}

/**
 实现WXImgLoaderProtocol协议的下载图片
 优先使用缓存
 */
class WeexImgLoader: NSObject, WXImgLoaderProtocol {
    func downloadImage(withURL url: String!, imageFrame: CGRect, userInfo options: [AnyHashable : Any]! = [:], completed completedBlock: ((UIImage?, Error?, Bool) -> Void)!) -> WXImageOperationProtocol! {
            
        return WXImageOperation.init(task:
            /**
             优先通过缓存
            */
            KingfisherManager.shared.retrieveImage(with: ImageResource(downloadURL: URL(string: url)!, cacheKey: url),
                                                   options: [.transition(ImageTransition.fade(0.33))],
                                                   progressBlock: nil,
                                                   completionHandler: {
                (image, error, url, data) in
                completedBlock?(image, error, data != nil ? true : false)
            })
        )
    }
}

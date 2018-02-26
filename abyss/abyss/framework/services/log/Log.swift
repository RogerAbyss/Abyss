//
//  Log.swift
//  abyss
//
//  Created by 任超 on 2018/2/26.
//  Copyright © 2018年 Abyss. All rights reserved.
//

import Foundation

/**
 # 日志打印
 ```
 为了性能提升, debug默认下 不会打印
 ```
 */
public func Log(_ smt: Any) {
    #if DEBUG
        print(smt)
    #endif
}

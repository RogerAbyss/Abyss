//
//  AppGlobalManager.swift
//  zgxlSwift
//
//  Created by 任超 on 2018/1/18.
//  Copyright © 2018年 Chongqing Xilian Technology Development Co., Ltd. All rights reserved.
//

import Foundation

/**
 # App全局管理
 
 包括各种三方服务等
 <br>
 */
open class AppGlobalManager {
    /**
     ## pluginServices(插件管理服务)
     <br>
     
     通过插件模式管理系统关键回调
     如 进入App,App进入后台,App返回前台 等
     */
    public class pluginServices
    {
        /** 插件列表, 实时生效 */
        public func plugins() -> [PluginService] {
            return basePlugin()
        }
        
        /** 添加插件 */
        public func addPlugin(_ plugin: PluginService) {
            
        }
        
        /** 删除插件 */
        public func removePlugin(_ plugin: PluginService) {
            
        }
        
        /** 基础插件 */
        public func basePlugin() -> [PluginService] {
            return [PluginDebug(),PluginPermission()]
        }
    }
}

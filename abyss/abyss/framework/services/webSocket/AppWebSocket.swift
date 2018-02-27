//
//  AppWebSocket.swift
//  zgxlSwift
//
//  Created by 任超 on 2018/1/24.
//  Copyright © 2018年 Chongqing Xilian Technology Development Co., Ltd. All rights reserved.
//

import Foundation
import Starscream

/**
 AppWebSocket
 use 🧜🏻 to filter console info
 */
public class AppWebSocket {
    static var shared = AppWebSocket()
    var socket: WebSocket!
    let url = "ws://\(AppGlobalConfiguration.Net.websocket()[0].host):\(AppGlobalConfiguration.Net.websocket()[0].port)"
    
    func connect() {
        if socket != nil && socket.isConnected {
            ping()
        } else {
            var request = URLRequest(url: URL(string: url)!)
            request.timeoutInterval = 30
            socket = WebSocket(request: request)
            
            socket.pongDelegate = self
            socket.delegate = self
            
            socket.connect()
        }
    }
    
    func send() {
        if socket.isConnected {
            socket.write(string: "[Abyss]登录了, 给大家说一声!")
        }
    }
    
    func ping() {
        socket.write(ping: Data())
    }
}

extension AppWebSocket: WebSocketPongDelegate {
    public func websocketDidReceivePong(socket: WebSocketClient, data: Data?) {
        print("🧜🏻 pong")
    }
}

extension AppWebSocket: WebSocketDelegate {
    public func websocketDidConnect(socket: WebSocketClient) {
        print("🧜🏻 websocket is connected")
        
        self.send()
        self.ping()
    }

    public func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        if let e = error as? WSError {
            print("🧜🏻 websocket is disconnected: \(e.message)")
        } else if let e = error {
            print("🧜🏻 websocket is disconnected: \(e.localizedDescription)")
        } else {
            print("🧜🏻 websocket disconnected")
        }
    }

    public func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("🧜🏻 Received text: \(text)")
    }

    public func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("🧜🏻 Received data: \(data.count)")
    }
}


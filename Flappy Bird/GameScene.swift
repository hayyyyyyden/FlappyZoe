//
//  GameScene.swift
//  Flappy Bird
//
//  Created by fang on 15/12/2.
//  Copyright (c) 2015年 Fang YiXiong. All rights reserved.
//

import SpriteKit

enum 图层: CGFloat {
    case 背景
    case 前景
    case 游戏角色
}


class GameScene: SKScene {
    
    let k重力: CGFloat = -1500.0
    let k上冲速度: CGFloat = 400.0
    var 速度 = CGPoint.zero
    
    let 世界单位 = SKNode()
    var 游戏区域起始点: CGFloat = 0
    var 游戏区域的高度: CGFloat = 0
    let 主角 = SKSpriteNode(imageNamed: "Bird0")
    var 上一次更新时间: NSTimeInterval = 0
    var dt: NSTimeInterval = 0
    
    override func didMoveToView(view: SKView) {
        addChild(世界单位)
        设置背景()
        设置前景()
        设置主角()
    }
    
    // MARK: 设置的相关方法
    
    func 设置背景() {
        let 背景 = SKSpriteNode(imageNamed: "Background")
        背景.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        背景.position = CGPoint(x: size.width/2, y: size.height)
        背景.zPosition = 图层.背景.rawValue
        世界单位.addChild(背景)
        
        游戏区域起始点 = size.height - 背景.size.height
        游戏区域的高度 = 背景.size.height
        
    }
    
    func 设置主角() {
        主角.position = CGPoint(x: size.width * 0.2, y: 游戏区域的高度 * 0.4 + 游戏区域起始点)
        主角.zPosition = 图层.游戏角色.rawValue
        世界单位.addChild(主角)
    }
    
    func 设置前景() {
        let 前景 = SKSpriteNode(imageNamed: "Ground")
        前景.anchorPoint = CGPoint(x: 0, y: 1.0)
        前景.position = CGPoint(x: 0, y: 游戏区域起始点)
        前景.zPosition = 图层.前景.rawValue
        世界单位.addChild(前景)
    }
    
    // MARK: 游戏流程
    
    func 主角飞一下() {
        速度 = CGPoint(x: 0, y: k上冲速度)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        主角飞一下()
    }
    
    // MARK: 更新
   
    override func update(当前时间: CFTimeInterval) {
        if 上一次更新时间 > 0 {
            dt = 当前时间 - 上一次更新时间
        } else {
            dt = 0
        }
        上一次更新时间 = 当前时间
        
        更新主角()
    }
    
    func 更新主角() {
        let 加速度 = CGPoint(x: 0, y: k重力)
        速度 = 速度 + 加速度 * CGFloat(dt)
        主角.position = 主角.position + 速度 * CGFloat(dt)
        
        // 检测撞击地面时让其停在地面上
        if 主角.position.y - 主角.size.height/2 < 游戏区域起始点 {
            主角.position = CGPoint(x: 主角.position.x, y: 游戏区域起始点 + 主角.size.height/2)
        }
    }
    
    
    
}

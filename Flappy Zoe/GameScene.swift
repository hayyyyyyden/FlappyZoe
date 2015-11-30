//
//  GameScene.swift
//  Flappy Zoe
//
//  Created by fang on 15/11/30.
//  Copyright (c) 2015年 Fang YiXiong. All rights reserved.
//

import SpriteKit

enum 图层: CGFloat {
    case 背景
    case 前景
    case 游戏角色
}

class GameScene: SKScene {
    
    let 世界单位 = SKNode()
    
    override func didMoveToView(view: SKView) {
        addChild(世界单位)
        设置背景()
    }
    
    //  MARK: 设置的相关方法
    
    func 设置背景() {
        let 背景 = SKSpriteNode(imageNamed: "Background")
        背景.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        背景.position = CGPoint(x: size.width/2, y: size.height)
        背景.zPosition = 图层.背景.rawValue
        世界单位.addChild(背景)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
   
    override func update(currentTime: CFTimeInterval) {

    }
}

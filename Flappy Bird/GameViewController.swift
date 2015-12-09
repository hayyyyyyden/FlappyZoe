//
//  GameViewController.swift
//  Flappy Bird
//
//  Created by fang on 15/12/2.
//  Copyright (c) 2015年 Fang YiXiong. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let sk视图 = self.view as? SKView {
            if sk视图.scene == nil {
                //  创建场景
                let 长宽比 = sk视图.bounds.size.height / sk视图.bounds.size.width
                let 场景 = GameScene(size:CGSize(width: 320, height: 320 * 长宽比))
                sk视图.showsFPS = true
                sk视图.showsNodeCount = true
                sk视图.showsPhysics = true
                sk视图.ignoresSiblingOrder = true
                
                场景.scaleMode = .AspectFill
                
                sk视图.presentScene(场景)
            }
        }
        
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}


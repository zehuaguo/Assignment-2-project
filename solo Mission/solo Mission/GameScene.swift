//
//  GameScene.swift
//  solo Mission
//
//  Created by zehua guo on 2018/4/30.
//  Copyright © 2018年 zehua guo. All rights reserved.
//

import SpriteKit
//import GameplayKit

class GameScene: SKScene {
    let player = SKSpriteNode(imageNamed: "playerShip")
    let bulletSound = SKAction.playSoundFileNamed("bulletSoundEffect.mp3", waitForCompletion: false)
    
    
    
    
    
    override func didMove(to view: SKView) {
         let background = SKSpriteNode(imageNamed: "background")
         background.size = self.size
         background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
         background.zPosition = 0
         self.addChild(background)
         
        
         player.setScale(1)
         player.position = CGPoint(x: self.size.width/2, y: size.height * 0.2)
         player.zPosition = 2
         self.addChild(player)
        
    }
    
    
    func fireBullet() {
        let bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.setScale(1)
        bullet.position = player.position
        bullet.zPosition = 1
        self.addChild(bullet)
        
        let moveBullet = SKAction.moveTo(y: self.size.height + bullet.size.height, duration: 1)
        let deleteBullet = SKAction.removeFromParent()
        let bulletSequence = SKAction.sequence([bulletSound, moveBullet, deleteBullet])
        bullet.run(bulletSequence)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fireBullet()
    }
    
    
    
    
}

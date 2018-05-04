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
    
    var gameAewa: CGRect
    override init(size: CGSize)
    {
        let maxAspectRtio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRtio
        let margin = (size.width - playableWidth) / 2
        gameAewa = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        
        
        
        
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
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
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let previousPointOfTouch = touch.previousLocation(in: self)
            let amountDragged = pointOfTouch.x - previousPointOfTouch.x
            player.position.x += amountDragged
            if player.position.x > CGRectGetMixX(gameAewa)
            {
                
            }
            //    player.position.x = CGRectGetMaxX(gameAewa)
            
            
            
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

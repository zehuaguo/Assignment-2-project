//
//  GameViewController.swift
//  solo Mission
//
//  Created by zehua guo on 2018/4/30.
//  Copyright © 2018年 zehua guo. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //jintianzhenshigehaotianqi
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        let scene = GameScene(size: CGSize (width: 1536, height: 2048))
            
            // Get the SKScene from the loaded GKScene
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
        
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

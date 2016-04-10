//
//  GameViewController.swift
//  TextShooter
//
//  Created by Steve D'Amico on 4/7/16.
//  Copyright (c) 2016 Steve D'Amico. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets view to the same size of the scene
        let scene = StartScene(size: view.frame.size)
        
        // Configure the view.
        let skView = self.view as! SKView
        
        // Used fordebugging, set to false at release
        skView.showsFPS = false
        skView.showsNodeCount = false
            
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
            
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
            
        skView.presentScene(scene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // Hides status bar while game is playing
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

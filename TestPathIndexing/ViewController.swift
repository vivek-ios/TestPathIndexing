//
//  ViewController.swift
//  TestPathIndexing
//
//  Created by Test on 13/02/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import OpenGLES
import SpriteKit
import GameplayKit

class ViewController: UIViewController {

    let scene = LogicScene(fileNamed: "LogicScene")!

    
    @IBAction func handleTap(_ sender: Any) {
        
         scene.createOrSolveMaze()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let skView = view as! SKView
        
        // Set the scale mode to scale to fit the window.
        scene.scaleMode = .aspectFit
        
        skView.presentScene(scene)
        
        // SpriteKit applies additional optimizations to improve rendering performance.
        skView.ignoresSiblingOrder = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


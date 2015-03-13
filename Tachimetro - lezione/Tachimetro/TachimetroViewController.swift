//
//  GameViewController.swift
//  IK-Ninja
//
//  Created by Ken Toh on 7/9/14.
//  Copyright (c) 2014 Ken Toh. All rights reserved.
//

import UIKit
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as Tachimetro
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class TachimetroViewController: UIViewController {
    
    @IBOutlet weak var tachimetroView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        if let scene = Tachimetro.unarchiveFromFile("Tachimetro") as? Tachimetro {
            // Configure the view.
            tachimetroView.showsFPS = false
            tachimetroView.showsNodeCount = false
            scene.backgroundColor = SKColor.blackColor()
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            tachimetroView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = SKSceneScaleMode.ResizeFill
            
            let s = tachimetroView.bounds.size
            // Set the view bounds dynamically
            scene.size = s
            
            tachimetroView.presentScene(scene)
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

//
//  SprideLink.swift
//  spredishit
//
//  Created by Davide Patrizi on 28/02/15.
//  Copyright (c) 2015 Davide Patrizi. All rights reserved.
//

import Foundation
import SpriteKit

extension SKNode {
    class func unarchiveFromFile<T:SKScene>(file : NSString) -> T? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as T
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class SprideLink: SKScene, SKPhysicsContactDelegate{
    var empty: SKNode!
    var lancetta: SKNode!
    
    override func didMoveToView(view: SKView) {
        //self.nodeAtPoint(<#p: CGPoint#>)
        empty = (self as SKNode).childNodeWithName("empty")
        lancetta = (self as SKNode).childNodeWithName("lancetta")
    }
}
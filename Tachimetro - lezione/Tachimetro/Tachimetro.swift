//
//  WalkingManScene.swift
//  GetOnUp
//
//  Created by Gabriele Cocco on 27/01/2015.
//  Copyright (c) 2015 BioBeats. All rights reserved.
//

import Foundation
import SpriteKit

extension SKNode {
    class func unarchiveFromFileForScene(file : NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as SKScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class Tachimetro: SKScene, SKPhysicsContactDelegate
{
    var empty: SKNode!
    var lancetta: SKNode!
    var effector: SKNode!
    var centro: SKNode!
    var number1: SKNode!
    var number2: SKNode!
    var number3: SKNode!
    
    override func didMoveToView(view: SKView)
    {
        centro = childNodeWithName("centro")
        
        lancetta = centro.childNodeWithName("lancetta")
        effector = lancetta.childNodeWithName("empty")
        number1 = self.childNodeWithName("number1")
        number2 = self.childNodeWithName("number2")
        number3 = self.childNodeWithName("number3")
        
        number3.runAction(
            SKAction.repeatActionForever(
                SKAction.animateWithTextures([
                    SKTexture(imageNamed: "t0"),
                    SKTexture(imageNamed: "1"),
                    SKTexture(imageNamed: "2"),
                    SKTexture(imageNamed: "3")], timePerFrame: 0.05)))
        number2.runAction(
            SKAction.repeatActionForever(
                SKAction.animateWithTextures([
                    SKTexture(imageNamed: "t0"),
                    SKTexture(imageNamed: "1"),
                    SKTexture(imageNamed: "2"),
                    SKTexture(imageNamed: "3")], timePerFrame: 0.2)))
        number1.runAction(
            SKAction.repeatActionForever(
                SKAction.animateWithTextures([
                    SKTexture(imageNamed: "t0"),
                    SKTexture(imageNamed: "1"),
                    SKTexture(imageNamed: "2"),
                    SKTexture(imageNamed: "3")], timePerFrame: 0.8)))
        number1.runAction(SKAction.speedTo(0.5, duration: 0.2));
        number2.runAction(SKAction.speedTo(0.5, duration: 0.2));
        number3.runAction(SKAction.speedTo(0.5, duration: 0.2));
    }
    
    func moveLancettaAtLocation(location: CGPoint) {
        // 1
        let punch = SKAction.reachTo(location, rootNode: lancetta, duration: 0.5)
        // 2
        punch.timingFunction = backEaseOut;
        effector.runAction(punch)
        
        // Check speed
        var percentage = min(1.0, location.x / self.frame.size.width);
        if(percentage > 0) {
            number1.runAction(SKAction.speedTo(percentage, duration: 0.2));
            number2.runAction(SKAction.speedTo(percentage, duration: 0.2));
            number3.runAction(SKAction.speedTo(percentage, duration: 0.2));
        }
        
        self.runAction(SKAction.playSoundFileNamed("engine.wav", waitForCompletion: false));
    }
    
    // 3
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            moveLancettaAtLocation(location)
        }
    }
    func backEaseOut(t: Float) -> Float {
        if t < 1.0 / 2.75 {
            return 7.5625 * t * t
        } else if t < 2.0 / 2.75 {
            let f = t - 1.5 / 2.75
            return 7.5625 * f * f + 0.75
        } else if t < 2.5 / 2.75 {
            let f = t - 2.25 / 2.75
            return 7.5625 * f * f + 0.9375
        } else {
            let f = t - 2.625 / 2.75
            return 7.5625 * f * f + 0.984375
        }
    }
    
}

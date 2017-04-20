//
//  GameplayScene.swift
//  quizzard
//
//  Created by Nick Koulias on 19/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameplayScene: SKScene {
    
    var player: Player?;
    var canSpin = false;
    
    override func didMove(to view: SKView) {
        player = self.childNode(withName: "spinner") as! Player?;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
         player?.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat.pi * 2, duration: 0.75)), withKey: "rotate")
 */
        let random = GKRandomDistribution(lowestValue: 20, highestValue: 90)
        let r = random.nextInt()
        //print(r)
        player?.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.frame.width))
        player?.physicsBody?.affectedByGravity = false
        player?.physicsBody?.isDynamic = true
        player?.physicsBody?.allowsRotation = true
        player?.physicsBody?.angularVelocity = CGFloat(r)
        player?.physicsBody?.angularDamping = 1.0
 }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
      //  player?.removeAction(forKey: "rotate")
        //
    }
}

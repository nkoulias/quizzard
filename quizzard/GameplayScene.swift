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
    
    override func didMove(to view: SKView) {
        player = self.childNode(withName: "spinner") as! Player?;
    }
    
    func getLabels() {
        GameplayController.instance.scoreText = self.childNode(withName: "score") as? SKLabelNode!
        GameplayController.instance.lifeText = self.childNode(withName: "lives") as? SKLabelNode!
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        let random = GKRandomDistribution(lowestValue: 20, highestValue: 90)
        let r = random.nextInt()
        
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "play_button" {
                player?.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.frame.width))
                player?.physicsBody?.affectedByGravity = false
                player?.physicsBody?.isDynamic = true
                player?.physicsBody?.allowsRotation = true
                player?.physicsBody?.angularVelocity = CGFloat(r)
                player?.physicsBody?.angularDamping = 1.0
                
            }
        }

        
 }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        

    }
}

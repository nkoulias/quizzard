//
//  Maths.swift
//  quizzard
//
//  Created by Nick Koulias on 26/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit
import GameplayKit

class Maths: SKSpriteNode {
    
    func initializeMaths() {
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "Maths.png"), size: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.pinned = true
        self.physicsBody?.categoryBitMask = ColliderType.Maths
        self.physicsBody?.contactTestBitMask = ColliderType.Pin
        
    }
    func rotateMaths() {
        let random = GKRandomDistribution(lowestValue: 20, highestValue: 90)
        let r = random.nextInt()
        self.physicsBody?.angularVelocity = CGFloat(r)
        self.physicsBody?.angularDamping = 1.0
        
    }
    
}

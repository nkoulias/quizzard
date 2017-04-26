//
//  Science.swift
//  quizzard
//
//  Created by Nick Koulias on 26/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit
import GameplayKit

class Science: SKSpriteNode {
    
    func initializeScience() {
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "Science.png"), size: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.pinned = true
        self.physicsBody?.categoryBitMask = ColliderType.Science
        self.physicsBody?.contactTestBitMask = ColliderType.Pin
        
    }
    func rotateScience() {
        let random = GKRandomDistribution(lowestValue: 20, highestValue: 90)
        let r = random.nextInt()
        self.physicsBody?.angularVelocity = CGFloat(r)
        self.physicsBody?.angularDamping = 1.0
        
    }
}

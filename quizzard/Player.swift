//
//  Player.swift
//  quizzard
//
//  Created by Nick Koulias on 19/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit
import GameplayKit

struct ColliderType {
    static let Player: UInt32 = 0
    static let Geography: UInt32 = 1
    static let Maths: UInt32 = 2
    static let History: UInt32 = 3
    static let Science: UInt32 = 4
    static let Pin: UInt32 = 5
}


class Player: SKSpriteNode {
    
    func initializePlayer() {
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.frame.width))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.pinned = true
        self.physicsBody?.categoryBitMask = ColliderType.Player
    }
    func rotatePlayer() {
        let random = GKRandomDistribution(lowestValue: 20, highestValue: 90)
        let r = random.nextInt()
        self.physicsBody?.angularVelocity = CGFloat(r)
        self.physicsBody?.angularDamping = 1.0
        
    }
}

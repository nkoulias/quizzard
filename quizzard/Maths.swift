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
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "maths_selection.png"), size: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false
       self.physicsBody?.pinned = true
        self.physicsBody?.categoryBitMask = ColliderType.Maths
        self.physicsBody?.contactTestBitMask = ColliderType.Pin
        
    }
    
}

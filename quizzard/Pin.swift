//
//  Pin.swift
//  quizzard
//
//  Created by Nick Koulias on 26/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit

class Pin : SKSpriteNode {

    func initializePin() {
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "pin.png"), size: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.pinned = true
        self.physicsBody?.categoryBitMask = ColliderType.Pin
        self.physicsBody?.contactTestBitMask = ColliderType.Geography
        self.physicsBody?.contactTestBitMask = ColliderType.History
        self.physicsBody?.contactTestBitMask = ColliderType.Maths
        self.physicsBody?.contactTestBitMask = ColliderType.Science

    }
}

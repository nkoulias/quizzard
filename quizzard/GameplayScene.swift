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
    
    var player: Player?
    
    override func didMove(to view: SKView) {
        player = self.childNode(withName: "spinner") as! Player?;
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "play_button" {
                let random = GKRandomDistribution(lowestValue: 20, highestValue: 90)
                let r = random.nextInt()
                player?.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.frame.width))
                player?.physicsBody?.affectedByGravity = false
                player?.physicsBody?.isDynamic = true
                player?.physicsBody?.allowsRotation = true
                player?.physicsBody?.pinned = true
                player?.physicsBody?.angularVelocity = CGFloat(r)
                player?.physicsBody?.angularDamping = 1.0
            } else if atPoint(location).name == "back_button" {
                let play_scene = CharacterSelectScene(fileNamed: "CharacterSelect")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
            }

        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    override func didSimulatePhysics() {
        
        let speed = player?.physicsBody?.angularVelocity
        if (speed != nil) {
            if (speed! <= CGFloat(0.01)){
                let play_scene = Questions(fileNamed: "QuestionScene")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
            }
        }
    }
}

//
//  GameplayScene.swift
//  quizzard
//
//  Created by Nick Koulias on 19/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameplayScene: SKScene, SKPhysicsContactDelegate {
    
    var player: Player?
    var maths: Maths?
    var history: History?
    var science: Science?
 //   var geography: Geography?
    var pin: Pin?
    
    override func didMove(to view: SKView) {
        player = self.childNode(withName: "spinner") as! Player?;
        maths = player?.childNode(withName: "maths") as! Maths?
        science = player?.childNode(withName: "science") as! Science?
        history = player?.childNode(withName: "history") as! History?
   //     geography = player?.childNode(withName: "geography") as! Geography?
        pin = self.childNode(withName: "pin") as! Pin?
        player?.initializePlayer()
        maths?.initializeMaths()
        science?.initializeScience()
        history?.initializeHistory()
        pin?.initializePin()
        //geography?.initializeGeography()

        
        
        physicsWorld.contactDelegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            //Start spinning the wheel
            if atPoint(location).name == "play_button" {
                player?.physicsBody?.angularVelocity = 0
                player?.rotatePlayer()
                
                //Click back button
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
        //Wait for wheel to stop spinning before navigating to question scene
        let speed = player?.physicsBody?.angularVelocity
        if (speed != nil) {
            if (speed! <= CGFloat(0.1)){
                player?.physicsBody?.angularVelocity = 0
//                let play_scene = Questions(fileNamed: "QuestionScene")
//                play_scene?.scaleMode = .aspectFill
//                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
            }
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
//        print("in")
//        var topic :String = "empty"
//        var firstBody = SKPhysicsBody()
//        var secondBody = SKPhysicsBody()
//        if (contact.bodyA.node?.name == "pin") {
//            firstBody = contact.bodyA
//            secondBody = contact.bodyB
//        } else {
//            firstBody = contact.bodyB
//            secondBody = contact.bodyA
//        }
//        if (firstBody.node?.name == "pin" && secondBody.node?.name == "geography") {
//            topic = "geography"
//            print(topic)
//        }
    }
}

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
    
    private var player: Player?
    private var maths: Maths?
    private var history: History?
    private var science: Science?
    private var geography: Geo?
    var lives:UInt32 = 3
    var lives_text = SKLabelNode()
    var lives_char = SKSpriteNode()
    var main_char = SKSpriteNode()
    
    var pin: Pin?
    public var topic :String = ""
    public var finishedRotation: Bool = false
    
    override func didMove(to view: SKView) {
        
    //    let char_scene = CharacterSelectScene(fileNamed: "CharacterSelect")
     //   let angry_teacher = char_scene?.childNode(withName: "angry_teacher")
        player = self.childNode(withName: "spinner") as! Player?;
        maths = player?.childNode(withName: "maths") as! Maths?
        science = player?.childNode(withName: "science") as! Science?
        history = player?.childNode(withName: "history") as! History?
        geography = player?.childNode(withName: "geography") as! Geo?
        pin = self.childNode(withName: "pin") as! Pin?
        finishedRotation = false
        player?.initializePlayer()
        maths?.initializeMaths()
        science?.initializeScience()
        history?.initializeHistory()
        pin?.initializePin()
        geography?.initializeGeo()
        physicsWorld.contactDelegate = self
        if Question.instance.character == "angry_teacher"{
            lives_char = SKSpriteNode(imageNamed: "angry_teacher_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "angry_teacher")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            self.addChild(lives_char)
            self.addChild(main_char)
        } else if Question.instance.character == "green_monster"{
            lives_char = SKSpriteNode(imageNamed: "single_eye_green_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "single_eye_green")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.9)
            self.addChild(lives_char)
            self.addChild(main_char)
        } else if Question.instance.character == "slow_monster"{
            lives_char = SKSpriteNode(imageNamed: "purple_cutey_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "purple_cutey")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.8)
            self.addChild(lives_char)
            self.addChild(main_char)
        } else if Question.instance.character == "drinking_monster"{
            lives_char = SKSpriteNode(imageNamed: "party_animal_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "party_animal")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            self.addChild(lives_char)
            self.addChild(main_char)
        } else if Question.instance.character == "octopus"{
            lives_char = SKSpriteNode(imageNamed: "octopus_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "octopus")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.9)
            self.addChild(lives_char)
            self.addChild(main_char)
        } else if Question.instance.character == "monocle"{
            lives_char = SKSpriteNode(imageNamed: "monocle_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "monocle")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.9)
            self.addChild(lives_char)
            self.addChild(main_char)
        } else if Question.instance.character == "happy_monster"{
            lives_char = SKSpriteNode(imageNamed: "green_monster_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "green_monster")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.8)
            self.addChild(lives_char)
            self.addChild(main_char)
        }
        switch lives {
        case 1:
            lives_text = self.childNode(withName: "lives_text") as! SKLabelNode
            lives_text.position = CGPoint(x: lives_char.position.x+75, y: lives_char.position.y)
            lives_text.text = "x1"
        case 2:
            lives_text = self.childNode(withName: "lives_text") as! SKLabelNode
            lives_text.position = CGPoint(x: lives_char.position.x+75, y: lives_char.position.y)
            lives_text.text = "x2"
        case 3:
            lives_text = self.childNode(withName: "lives_text") as! SKLabelNode
            lives_text.position = CGPoint(x: lives_char.position.x+75, y: lives_char.position.y)
            lives_text.text = "x3"
        default:
            break
        }
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
            } else if atPoint(location).name == "settings_button" {
                let play_scene = SettingsScene(fileNamed: "SettingsScene")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
            }
        }
    }
    
    override func didSimulatePhysics() {
        let speed = player?.physicsBody?.angularVelocity
        if (speed != CGFloat(0.0)) {
            if (speed! <= CGFloat(0.1)){
                finishedRotation = true
            }
        }
    }
    override func didFinishUpdate() {
        if (finishedRotation == true) {
            let play_scene = QuestionScene(fileNamed: "QuestionScene")
            play_scene?.scaleMode = .aspectFill
            self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        if (contact.bodyA.node?.name == "pin") {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        if (firstBody.node?.name == "pin" && secondBody.node?.name == "geography") {
            Question.instance.topic = "geography"
        } else if (firstBody.node?.name == "pin" && secondBody.node?.name == "maths") {
            Question.instance.topic = "maths"
        } else if (firstBody.node?.name == "pin" && secondBody.node?.name == "history") {
            Question.instance.topic = "history"
        } else if (firstBody.node?.name == "pin" && secondBody.node?.name == "science") {
            Question.instance.topic = "science"
        }
    }
}

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
//    var lives_char = SKSpriteNode()
//    var main_char = SKSpriteNode()
    
    var pin: Pin?
    public var topic :String = ""
    public var finishedRotation: Bool = false
    
    override func didMove(to view: SKView) {
        
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
        Question.instance.setLives()
        self.addChild(Question.instance.lives_char)
        self.addChild(Question.instance.main_char)

    }
    func updateLives() {
        
        
        switch lives {
        case 1:
            lives_text = self.childNode(withName: "lives_text") as! SKLabelNode
            lives_text.position = CGPoint(x: Question.instance.lives_char.position.x+75, y: Question.instance.lives_char.position.y-15)
            lives_text.text = "x1"
        case 2:
            lives_text = self.childNode(withName: "lives_text") as! SKLabelNode
            lives_text.position = CGPoint(x: Question.instance.lives_char.position.x+75, y: Question.instance.lives_char.position.y-15)
            lives_text.text = "x2"
        case 3:
            lives_text = self.childNode(withName: "lives_text") as! SKLabelNode
            lives_text.position = CGPoint(x: Question.instance.lives_char.position.x+75, y: Question.instance.lives_char.position.y-15)
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

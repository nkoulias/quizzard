//
//  Question.swift
//  quizzard
//
//  Created by Nick Koulias on 28/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

final class Question {
    
    private init () {}
    static let instance = Question();
    
    var topic:String = ""
    var character:String=""
    var lives: UInt32 = 3
    var lives_text = SKLabelNode()
    var lives_char = SKSpriteNode()
    var main_char = SKSpriteNode()
    
    func setLivesIcon() {
        switch Question.instance.character {
        case "angry_teacher":
            lives_char = SKSpriteNode(imageNamed: "angry_teacher_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "angry_teacher")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
        case "green_monster":
            lives_char = SKSpriteNode(imageNamed: "single_eye_green_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "single_eye_green")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.9)
        case "slow_monster":
            lives_char = SKSpriteNode(imageNamed: "purple_cutey_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "purple_cutey")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.8)
        case "drinking_monster":
            lives_char = SKSpriteNode(imageNamed: "party_animal_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "party_animal")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
        case "octopus":
            lives_char = SKSpriteNode(imageNamed: "octopus_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "octopus")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.9)
        case "monocle":
            lives_char = SKSpriteNode(imageNamed: "monocle_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "monocle")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.9)
        case "happy_monster":
            lives_char = SKSpriteNode(imageNamed: "green_monster_small")
            lives_char.position = CGPoint(x: -295, y: 495)
            lives_char.zPosition = CGFloat(5.0)
            main_char = SKSpriteNode(imageNamed: "green_monster")
            main_char.zPosition = CGFloat(1.0)
            main_char.position = CGPoint(x: 180, y: 180)
            main_char.setScale(0.8)
        default:
            break
        }
    }
    func setLivesText() {
        switch lives {
        case 1:
            lives_text.position = CGPoint(x: Question.instance.lives_char.position.x+75, y: Question.instance.lives_char.position.y-15)
            lives_text.fontName = "Blow.ttf"
            lives_text.fontSize = 48
            lives_text.color = UIColor(white: 1, alpha: 1)
            lives_text.text = "x1"
        case 2:
            lives_text.position = CGPoint(x: Question.instance.lives_char.position.x+75, y: Question.instance.lives_char.position.y-15)
            lives_text.fontName = "Blow.ttf"
            lives_text.fontSize = 48

            lives_text.text = "x2"
        case 3:
            lives_text.position = CGPoint(x: Question.instance.lives_char.position.x+75, y: Question.instance.lives_char.position.y-15)
            lives_text.fontName = "Blow.ttf"
            lives_text.color = UIColor(white: 1, alpha: 1)
            lives_text.fontSize = 48

            lives_text.text = "x3"
        default:
            break
        }
    }

}

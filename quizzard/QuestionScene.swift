//
//  QuestionScene.swift
//  quizzard
//
//  Created by Nick Koulias on 24/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit

class QuestionScene: SKScene {
    override func didMove(to view: SKView) {
        print(Question.instance.topic)
        let question = self.childNode(withName: "question_name") as? SKLabelNode
        question?.text = Question.instance.topic
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "back_button" {
                let play_scene = GameplayScene(fileNamed: "Spin")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
            }
        }
    }
}

//
//  QuestionScene.swift
//  quizzard
//
//  Created by Nick Koulias on 24/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit
import CloudKit
import MobileCoreServices
import AVFoundation
import AVKit
import Darwin
import Foundation

class QuestionScene: SKScene, AVSpeechSynthesizerDelegate {

//public let synth = AVSpeechSynthesizer()
    
    override func didMove(to view: SKView) {
        
        let defaults = UserDefaults.standard
        let decode_data = defaults.object(forKey: "Questions") as? Data
        let setup = NSKeyedUnarchiver.unarchiveObject(with: decode_data!) as! [Questions]
        let decode_topic = defaults.object(forKey: "Topic") as? String
        let filter = setup.filter({$0.topic == decode_topic}) 
        let qCount = filter.count
        let result = pickQuestion(input: UInt32(qCount))
        showData(input: result, filter: filter)
        RandomQuestions(input: Int(result), filter: filter)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "settings" {
                let play_scene = SettingsScene(fileNamed: "SettingsScene")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
            }
        }
    }
    func pickQuestion(input:UInt32) -> Int {
        return Int(arc4random() % input)
    }
    
    func RandomQuestions (input:Int, filter:[Questions]) {
        
        let synth = AVSpeechSynthesizer()
        synth.delegate = self
        let qUtterance = AVSpeechUtterance(string: filter[input].quest)
        let aUtterance = AVSpeechUtterance(string: filter[input].A)
        let bUtterance = AVSpeechUtterance(string: filter[input].B)
        let cUtterance = AVSpeechUtterance(string: filter[input].C)
        let dUtterance = AVSpeechUtterance(string: filter[input].D)
        let orUtterance = AVSpeechUtterance(string: "or")

        qUtterance.preUtteranceDelay = 1.0
        synth.speak(qUtterance)
        qUtterance.postUtteranceDelay = 0.1
        synth.speak(aUtterance)
        aUtterance.postUtteranceDelay = 0.1
        synth.speak(bUtterance)
        bUtterance.postUtteranceDelay = 0.1
        synth.speak(cUtterance)
        cUtterance.postUtteranceDelay = 0.1
        synth.speak(orUtterance)
        //orUtterance.postUtteranceDelay = 0.1
        synth.speak(dUtterance)
        
    }
    
    func showData(input: Int, filter: [Questions]) {
        
        //let question_label = SKLabelNode()
        let question_label = SKMultilineLabel(text: filter[input].quest, labelWidth: 700, pos: CGPoint(x: 0,y: 550))
     //   question_label.fontName = "Avenir.ttf"
      //  question_label.fontSize = 30
     //   question_label.fontColor = UIColor(white: 1, alpha: 1)
      //  question_label.position = CGPoint(x: 0, y: 400)
        question_label.zPosition = CGFloat(5.0)
      //  question_label.text = filter[input].quest
        self.addChild(question_label)
        
        let a_label = SKLabelNode()
        a_label.fontName = "Avenir.ttf"
        a_label.fontSize = 38
        a_label.color = UIColor(white: 1, alpha: 1)
        a_label.position = CGPoint(x: 0, y: 170)
        a_label.zPosition = CGFloat(5.0)
        a_label.text = filter[input].A
        self.addChild(a_label)
        
        let b_label = SKLabelNode()
        b_label.fontName = "Avenir.ttf"
        b_label.fontSize = 38
        b_label.color = UIColor(white: 1, alpha: 1)
        b_label.position = CGPoint(x: 0, y: 20)
        b_label.zPosition = CGFloat(5.0)
        b_label.text = filter[input].B
        self.addChild(b_label)
        
        let c_label = SKLabelNode()
        c_label.fontName = "Avenir.ttf"
        c_label.fontSize = 38
        c_label.color = UIColor(white: 1, alpha: 1)
        c_label.position = CGPoint(x: 0, y: -130)
        c_label.zPosition = CGFloat(5.0)
        c_label.text = filter[input].C
        self.addChild(c_label)
        
        let d_label = SKLabelNode()
        d_label.fontName = "Avenir.ttf"
        d_label.fontSize = 38
        d_label.color = UIColor(white: 1, alpha: 1)
        d_label.position = CGPoint(x: 0, y: -280)
        d_label.zPosition = CGFloat(5.0)
        d_label.text = filter[input].D
        self.addChild(d_label)
        
    }
}

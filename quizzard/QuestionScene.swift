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
        RandomQuestions(input: Int(result), filter: filter)
     //   showData(input: result, setup: filter)
        
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
//        myUtterance.rate = 0.5
//        myUtterance.volume = 1.0
//        myUtterance.preUtteranceDelay = 0.5
      //  myUtterance.postUtteranceDelay = 0.5
        qUtterance.preUtteranceDelay = 1.0
        synth.speak(qUtterance)
        qUtterance.postUtteranceDelay = 0.2
        synth.speak(aUtterance)
        aUtterance.postUtteranceDelay = 0.2
        synth.speak(bUtterance)
        bUtterance.postUtteranceDelay = 0.2
        synth.speak(cUtterance)
        cUtterance.postUtteranceDelay = 0.1
        synth.speak(orUtterance)
        orUtterance.postUtteranceDelay = 0.2
        synth.speak(dUtterance)
        
    }
    
    func showData(input: Int, setup: [Questions]) {
        let question = self.childNode(withName: "question_name") as? SKLabelNode
        question?.text = setup[input].quest
        question?.addChild(question!)
        
    }
}

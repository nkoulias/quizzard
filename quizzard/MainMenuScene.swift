//
//  MainMenuScene.swift
//  quizzard
//
//  Created by Nick Koulias on 21/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import SpriteKit
import CloudKit
import MobileCoreServices

class MainMenuScene: SKScene {
    
    
    
    override func didMove(to view: SKView) {
        
        GameManager.instance.initializeGameData()
        setupQuestions() {
            takeItAll in
            GameManager.instance.setQuestions(questions: takeItAll)
        }
        
    }
    
    func setupQuestions(completionHandler: @escaping (_ takeItAll: [Question]) ->()) {
            var allQuestions = [Question]()
            var A: String = ""
            var B: String = ""
            var C: String = ""
            var D: String = ""
            var topic: String = ""
            var answer:String = ""
            var quest_name:String = ""
            
            var container: CKContainer
            var publicDB: CKDatabase?
            container = CKContainer.default()
            publicDB = container.publicCloudDatabase
            let bobPredicate = NSPredicate(format: "Topic = 'Maths'")
            let query = CKQuery(recordType: "Question", predicate: bobPredicate)
            publicDB?.perform(query, inZoneWith: nil, completionHandler: ({results, error in
                
                if (error != nil) {
                    DispatchQueue.main.async() {
                        print(error!.localizedDescription)
                    }
                } else {
                    if results!.count > 0 {
                        var temp: Question
                        for i in 1...(results!.count) {
                            A = results?[i].object(forKey: "A") as! String
                            B = results?[i].object(forKey: "B") as! String
                            C = results?[i].object(forKey: "C") as! String
                            D = results?[i].object(forKey: "D") as! String
                            topic = results?[i].object(forKey: "Topic") as! String
                            answer = results?[i].object(forKey: "Answer") as! String
                            quest_name = results?[i].object(forKey: "Name") as! String
                            temp = Question(topic: topic, quest: quest_name, A: A, B: B, C: C, D: D, answer: answer)
                            allQuestions.append(temp)
                            completionHandler(allQuestions)
                            
                        }
                    } else {
                        DispatchQueue.main.async() {
                            print("No record matching the address was found")
                        }
                    }
                }
            }))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if atPoint(location).name == "play_button" {
                let play_scene = CharacterSelectScene(fileNamed: "CharacterSelect")
                play_scene?.scaleMode = .aspectFill
                self.view?.presentScene(play_scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1))
                
            }
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

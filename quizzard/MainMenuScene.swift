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
        
        var container: CKContainer
        var publicDB: CKDatabase?
        container = CKContainer.default()
        publicDB = container.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Question", predicate: predicate)
        publicDB?.perform(query, inZoneWith: nil, completionHandler: ({results, error in
            
            if (error != nil) {
                DispatchQueue.main.async() {
                    print(error!.localizedDescription)
                }
            } else {
                if results!.count > 0 {
                    
                
                    for result in results! {
                        print(result.object(forKey: "Name") as! String)
                    }
                    //    let record = results![0]
                    DispatchQueue.main.async() {
                        
                    }
                } else {
                    DispatchQueue.main.async() {
                        print("No record matching the address was found")
                    }
                }
            }
        }))
        GameManager.instance.initializeGameData()
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










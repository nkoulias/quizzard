//
//  GameplayController.swift
//  quizzard
//
//  Created by Nick Koulias on 23/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import Foundation
import SpriteKit

class GameplayController {
    
    static let instance = GameplayController();
    private init () {}
        var scoreText: SKLabelNode?
        var lifeText: SKLabelNode?
        
        var score: Int?
        var life: Int?
    
    func initializeVariables() {
        if GameManager.instance.gameStartedFromMainMenu {
            GameManager.instance.gameStartedFromMainMenu = false
            
   //         score = 0
     //       life = 3
       //     scoreText?.text = "\(String(describing: score))"
         //   lifeText?.text = "\(String(describing: life))"
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
        
}

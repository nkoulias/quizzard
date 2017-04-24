//
//  GameManager.swift
//  quizzard
//
//  Created by Nick Koulias on 23/4/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import Foundation

class GameManager {
    static let instance = GameManager()
    private init() {}
    
    var gameStartedFromMainMenu = false
    var gameRestartedPlayerDied = false
}

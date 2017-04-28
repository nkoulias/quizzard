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
}

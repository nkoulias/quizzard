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
import AVFoundation
import AVKit
import Darwin
let synth = AVSpeechSynthesizer()
var myUtterance = AVSpeechUtterance(string: "")
var myUtterance_correct = AVSpeechUtterance(string: "")
var myUtterance_incorrect = AVSpeechUtterance(string: "")
var option_a = ""
var option_b = ""
var option_c = ""
var option_d = ""
var option_answer = ""
var correct = ""
var incorrect = ""
var CorrectAnswer = String()
var Scr:Int = 0
var result = 0

class Question {
    
 //   private init () {}
    //static let instance = Question()
    
    var topic:String = ""
    var quest: String
    var A: String
    var B: String
    var C: String
    var D: String
    var answer: String
    var allQuestions = [Question]()
    
    
    
    
    // Memberwise initializer
    init(topic: String, quest: String, A: String, B: String, C: String, D: String, answer: String) {
        self.topic = topic
        self.quest = quest
        self.A = A
        self.B = B
        self.C = C
        self.D = D
        self.answer = answer
    }
    
    func setupQuestions() {
        
        let q1 = Question(topic: "Geography", quest: "An albatross is a", A: "bird", B: "beetle", C: "fruit", D: "city", answer: "bird")
            let q2 = Question(topic: "Maths", quest: "How many side of an isoceles triangle are equal", A: "two", B: "none", C: "three", D: "one", answer: "two")
            let q3 = Question(topic: "Geography", quest: "An albatross is a ", A: "bird", B: "beetle", C: "fruit", D: "city", answer: "bird")
            let q4 = Question(topic: "Science", quest: "What is the name of the closest star to earth ", A: "Alpha Centauri A", B: "Alpha Centauri B", C: "Proxima Centauri", D: "the sun", answer: "the sun")
            let q5 = Question(topic: "Geography", quest: "What is the driest desert on earth", A: "Atacama", B: "Sahara", C: "Simpson", D: "Kalahari", answer: "Atacama")
            let q7 = Question(topic: "Science", quest: "Stratus, cumulus and nimbus are all types of what", A: "fish", B: "shapes", C: "clouds", D: "insects", answer: "clouds")
            let q8 = Question(topic: "Maths", quest: "The perimeter of a circle is also known as what", A: "area", B: "volume", C: "radius", D: "circumference", answer: "circumference")
            let q9 = Question(topic: "Science", quest: "What are female elephants called", A: "pawns", B: "prides", C: "pods", D: "cows", answer: "cows")
            let q10 = Question(topic: "Geography", quest: "What is the name of the tallest mountain on Earth", A: "Vinson", B: "Everest", C: "Denali", D: "Koziosko", answer: "Everest")
            let q11 = Question(topic: "Science", quest: "Which planet is also known as the Red Planet", A: "Earth", B: "Venus", C: "Saturn", D: "Mars", answer: "Mars")
            let q12 = Question(topic: "Maths", quest: "How many sides does a nonagon have", A: "eight", B: "eleven", C: "twelve", D: "nine", answer: "nine")
//            let q13 = Questions(quest: "In which country will you find the famous pyramids of Giza", A: "Egypt", B: "Italy", C: "France", D: "Switzerland", answer: "Egypt")
//            let q14 = Questions(quest: "How often is the football world cup finals held", A: "every year", B: "twice a year", C: "every four years", D: "every second year", answer: "every four years")
//            let q15 = Questions(quest: "How many cards are contained in a standard deck", A: "forty eight", B: "fifty six", C: "fifty four", D: "fifty eight", answer: "fifty four")
//            let q16 = Questions(quest: "How many vertices does a hexagon have", A: "seven", B: "four", C: "six", D: "five", answer: "six")
//            let q17 = Questions(quest: "How many sides does a pentagon have", A: "six", B: "seven", C: "five", D: "eight", answer: "five")
//            let q18 = Questions(quest: "A group of lions are known as what", A: "flock", B: "bunch", C: "pod", D: "pride", answer: "pride")
//            let q19 = Questions(quest: "How many legs does a spider have", A: "six", B: "four", C: "eight", D: "ten", answer: "eight")
//            let q20 = Questions(quest: "The human face has how many bones", A: "thirty three", B: "fifteen", C: "thirty six", D: "fourteen", answer: "fourteen")
//            let q21 = Questions(quest: "The tour de france involves", A: "golf", B: "tennis", C: "cycling", D: "soccer", answer: "cycling")
//            let q22 = Questions(quest: "Body temperature is measured using", A: "hydrometer", B: "gyrometer", C: "thermometer", D: "Tempometer", answer: "thermometer")
//            let q23 = Questions(quest: "The largest ocean in the world is   ", A: "Indian", B: "Pacific", C: "Atlantic", D: "Southern", answer: "Pacific")
//            let q24 = Questions(quest: "What is the name for a triangle with no equal sides", A: "equalateral", B: "scalene", C: "angelene", D: "isoceles", answer: "scalene")
//            let q25 = Questions(quest: "What is the astronomical measure of distance", A: "Kilometre", B: "Yard", C: "Nanosecond", D: "Light Year", answer: "Light Year")
//            let q26 = Questions(quest: "Which chess piece holds the most value", A: "Rook", B: "Knight", C: "Pawn", D: "King", answer: "King")
//            let q27 = Questions(quest: "Which is the fastest land animal in the world", A: "lion", B: "cheetah", C: "monkey", D: "leopard", answer: "cheetah")
//            let q28 = Questions(quest: "What has the scientific element H 2 O", A: "mercury", B: "gas", C: "water", D: "lead", answer: "water")
//            let q29 = Questions(quest: "In which country would you find the leaning tower of Piza", A: "Italy", B: "France", C: "Germany", D: "Switzerland", answer: "Italy")
//            let q30 = Questions(quest: "What does the Roman numeral V represent", A: "ten", B: "fifty", C: "five", D: "one hundred", answer: "five")
//            let q31 = Questions(quest: "What does the Roman numeral C represent", A: "ten", B: "fifty", C: "five hundred", D: "one hundred", answer: "five hundred")
//            let q32 = Questions(quest: "How many kilogrammes are in a tonne", A: "one hundred", B: "five hundred", C: "one thousand", D: "ten", answer: "one thousand")
//            let q33 = Questions(quest: "How many metres in a kilometre", A: "one hundred", B: "one thousand", C: "ten thousand", D: "ten", answer: "one thousand")
//            let q34 = Questions(quest: "How many millimetres in a centimetre", A: "one hundred", B: "fifty", C: "thirty", D: "ten", answer: "ten")
//            let q35 = Questions(quest: "How many grams in a kilogram", A: "one hundred", B: "fifty", C: "ten", D: "one thousand", answer: "one thousand")
//            let q36 = Questions(quest: "What is the tallest animal in the world", A: "Giraffe", B: "wild brown bear", C: "ostrich", D: "hippopotamus", answer: "Giraffe")
//            let q37 = Questions(quest: "Helsinki is the capital of which country", A: "Poland", B: "Sweden", C: "Denmark", D: "Finland", answer: "Finland")
//            let q38 = Questions(quest: "When mixed together, which two colours make orange", A: "red and white", B: "red and yellow", C: "red and blue", D: "blue and yellow", answer: "red and yellow")
//            let q39 = Questions(quest: "How many sides does a heptagon have", A: "eleven", B: "ten", C: "five", D: "nine", answer: "seven")
//            let q40 = Questions(quest: "Which desert covers most of North Africa", A: "Simpson", B: "Sahara", C: "Atacama", D: "Kalahari", answer: "Sahara")
//            let q41 = Questions(quest: "The terms gale and breeze help describe the speed of what", A: "sound", B: "tornado", C: "wind", D: "cyclone", answer: "wind")
//            let q42 = Questions(quest: "An anemometer is used to measure what", A: "air pressure", B: "sunlight", C: "rainfall", D: "wind speed", answer: "wind speed")
//            let q43 = Questions(quest: "Which three sports form a triathlon", A: "swimming, cycling and running", B: "running, swimming and hiking", C: "swimming, hiking and canoeying", D: "running, jumping and throwing", answer: "swimming, cycling and running")
//            let q44 = Questions(quest: "What does Roman numeral X represent", A: "ten", B: "fifty", C: "one hundred", D: "five hundred", answer: "ten")
//            let q45 = Questions(quest: "How many hearts does an octopus have", A: "two", B: "three", C: "one", D: "four", answer: "three")
//            let q46 = Questions(quest: "In 'The Twelve Days of Christmas' song, how many lords are leaping", A: "one", B: "three", C: "twelve", D: "ten", answer: "ten")
//            let q47 = Questions(quest: "How many centimetres in a metre", A: "ten", B: "one hundred", C: "one thousand", D: "fifty", answer: "one hundred")
//            let q48 = Questions(quest: "How many athletic events form a decathlon", A: "five", B: "ten", C: "seven", D: "nine", answer: "ten")
//            let q49 = Questions(quest: "Saint Petersburg is a major city in what country?", A: "Ireland", B: "Russia", C: "Poland", D: "Germany", answer: "Russia")
//            let q50 = Questions(quest: "Tangiers would be found in which country", A: "Morocco", B: "Egypt", C: "South Africa", D: "Australia", answer: "Morocco")
//
            allQuestions.append(q1)
            allQuestions.append(q2)
            allQuestions.append(q3)
            allQuestions.append(q4)
            allQuestions.append(q5)
            allQuestions.append(q7)
            allQuestions.append(q8)
            allQuestions.append(q9)
            allQuestions.append(q10)
            allQuestions.append(q11)
            allQuestions.append(q12)
//            setupQuestions.append(q13)
//            setupQuestions.append(q14)
//            setupQuestions.append(q15)
//            setupQuestions.append(q16)
//            setupQuestions.append(q17)
//            setupQuestions.append(q18)
//            setupQuestions.append(q19)
//            setupQuestions.append(q20)
//            setupQuestions.append(q21)
//            setupQuestions.append(q22)
//            setupQuestions.append(q23)
//            setupQuestions.append(q24)
//            setupQuestions.append(q25)
//            setupQuestions.append(q26)
//            setupQuestions.append(q27)
//            setupQuestions.append(q28)
//            setupQuestions.append(q29)
//            setupQuestions.append(q30)
//            setupQuestions.append(q31)
//            setupQuestions.append(q32)
//            setupQuestions.append(q33)
//            setupQuestions.append(q34)
//            setupQuestions.append(q35)
//            setupQuestions.append(q36)
//            setupQuestions.append(q37)
//            setupQuestions.append(q38)
//            setupQuestions.append(q39)
//            setupQuestions.append(q40)
//            setupQuestions.append(q41)
//            setupQuestions.append(q42)
//            setupQuestions.append(q43)
//            setupQuestions.append(q44)
//            setupQuestions.append(q45)
//            setupQuestions.append(q46)
//            setupQuestions.append(q47)
//            setupQuestions.append(q48)
//            setupQuestions.append(q49)
//            setupQuestions.append(q50)
//            qCount = setupQuestions.count
    }
    
    func pickQuestion(input:UInt32) -> Int {
        return Int(arc4random() % input)
    }
    
    
    public func RandomQuestions (input:Int) {
        
        synth.delegate = (self as! AVSpeechSynthesizerDelegate)
       let option_a = allQuestions[input].A
        let option_b = allQuestions[input].B
        let option_c = allQuestions[input].C
        let option_d = allQuestions[input].D
        let option_answer = allQuestions[input].answer
//        QuestionLabel.text = setupQuestions[input].quest
//        Button1.setTitle (setupQuestions[input].A, for: UIControlState.normal)
//        Button2.setTitle (setupQuestions[input].B, for: UIControlState.normal)
//        Button3.setTitle (setupQuestions[input].C, for: UIControlState.normal)
//        Button4.setTitle (setupQuestions[input].D, for: UIControlState.normal)
//        Button1.layer.cornerRadius = 9
//        Button2.layer.cornerRadius = 9
//        Button3.layer.cornerRadius = 9
//        Button4.layer.cornerRadius = 9
        let totalUtterance: String = (allQuestions[input].quest + "..." + allQuestions[input].A + "..." + allQuestions[input].B + "..." + allQuestions[input].C + "... or ..." + allQuestions[input].D)
        
        myUtterance = AVSpeechUtterance(string: totalUtterance)
        myUtterance.preUtteranceDelay = 0.5
        myUtterance.postUtteranceDelay = 0.05
        //loadSpeechSettings()
        synth.speak(myUtterance)
        
    }
}

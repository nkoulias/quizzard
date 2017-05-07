//
//  DB.swift
//  quizzard
//
//  Created by Nick Koulias on 7/5/17.
//  Copyright © 2017 Nick Koulias. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DB {
     var dbRef : FIRDatabaseReference!
     var questionsRef: FIRDatabaseReference
    
    init() {
        dbRef = FIRDatabase.database().reference()
        questionsRef = dbRef.child("Questions")
        getQuestions()
    }
    func getQuestions() {
        questionsRef.observe(FIRDataEventType.childAdded) {
        (snapshot: FIRDataSnapshot) in
        let name = snapshot.value(forKey: "Name") as! String
        let a = snapshot.value(forKey: "Answer") as! String
        print(name, a)	
            
        }
    }
}

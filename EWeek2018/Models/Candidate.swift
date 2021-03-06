//
//  Candidate.swift
//  EWeek2018
//
//  Created by Aashima Garg on 12/26/17.
//  Copyright © 2017 SEC. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class Candidate: NSObject {
    var candidateRef:DatabaseReference!
    var name:String=""
    var organization:String=""
    var bio:String=""
    var votes:Int = 0
    var headshot:UIImage=UIImage(named:"WillFerrel")!
    var detailPhoto:UIImage=UIImage(named:"Bowtie Icon")!
    var amountRaised:Double
    var year:String=""
    
    // MARK: Initialization
    
    init(name: String, organization:String, bio:String, votes:Int, amountRaised:Double, headshot:UIImage, detailPhoto: UIImage, year:String) {
        // Initialize stored properties.
        self.name = name
        self.organization = organization
        self.bio = bio
        self.votes = votes
        self.amountRaised = amountRaised
        self.headshot = headshot
        self.detailPhoto = detailPhoto
        self.year = year
    }
    
    override convenience init() {
        self.init(name: "<NoName>", organization:"", bio:"", votes:0, amountRaised: 0, headshot:UIImage(named:"Bowtie Icon")!, detailPhoto: UIImage(named:"Bowtie Icon")!, year:"")
    }
    
    // Formats candidate data as dictionary for DB use excluding year
    func toDict()-> NSDictionary {
        return [
            "name": name,
            "organization": organization,
            "bio": bio,
            "votes":votes,
            "amountRaised":amountRaised
        ]
    }
    
    func getFirstName() -> String {
        return name.components(separatedBy: " ").first!
    }
    
    func getVoteCount(_ name:String, ref:DatabaseReference) -> Int {
        let childRef = ref.child(name)
        var votes:Int = 0
        
        childRef.observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            votes = value?["votes"] as? Int ?? 0
        })
        return votes
    }
    
    func getAmountRaised(_ name:String, ref:DatabaseReference) -> Double {
        let childRef = ref.child(name)
        var amountRaised:Double = 0.0
        
        childRef.observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            amountRaised = value?["amountRaised"] as? Double ?? 0
        })
        return amountRaised
    }
    
    func saveRef(_ name:String, dict:AnyObject, ref:DatabaseReference) {
        self.candidateRef = ref.child(self.name)
    }
}

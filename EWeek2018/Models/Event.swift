//
//  Event.swift
//  EWeek2018
//
//  Created by Aashima Garg on 12/26/17.
//  Copyright © 2017 SEC. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class Event {
    var eventRef:DatabaseReference!
    var name:String=""
    var organization:String=""
    var date:String=""
    var startTime:String=""
    var endTime:String=""
    var detailPhoto:UIImage=UIImage(named:"Bowtie Icon")!
    var description:String=""
    
    // MARK: Initialization
    
    init(name: String, organization:String, date: String, startTime:String, endTime:String, detailPhoto: UIImage, description:String) {
        // Initialize stored properties.
        self.name = name
        self.organization = organization
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
        self.detailPhoto = detailPhoto
        self.description = description
    }
    
// TODO: Default Constructor
//    override convenience init() {
//        self.init(name: "<NoName>", organization:"", bio:"", votes:0, amountRaised: 0, headshot:UIImage(named:"Bowtie Icon")!, detailPhoto: UIImage(named:"Bowtie Icon")!, year:"")
//    }
    
    func toDict()-> NSDictionary {
        return [
            "name": name,
            "organization": organization,
            "date": date,
            "startTime":startTime,
            "endTime":endTime,
            "descriptoin":description
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
        self.eventRef = ref.child(self.name)
    }
}

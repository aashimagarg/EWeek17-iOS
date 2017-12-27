//
//  Configrations.swift
//  EWeek2018
//
//  Created by Aashima Garg on 12/26/17.
//  Copyright © 2017 SEC. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class Configration: NSObject {
    var configrationteRef:DatabaseReference!
    var name:String=""
    var year:String=""
    var navColor:String=""
    var bkgColor:String=""
    var accentColor:String=""
    var logo:UIImage=UIImage(named:"logo")!
    
    // MARK: Initialization
    
    init(name: String, year:String, navColor:String, bkgColor:String, accentColor:String, logo:UIImage) {
        // Initialize stored properties.
        self.name = name
        self.year = year
        self.navColor = navColor
        self.bkgColor = bkgColor
        self.accentColor = accentColor
        self.logo = logo
    }
    
// TODO: add default constructor
//    override convenience init() {
//        self.init(name: "<NoName>", organization:"", bio:"", votes:0, amountRaised: 0, headshot:UIImage(named:"Bowtie Icon")!, detailPhoto: UIImage(named:"Bowtie Icon")!, year:"")
//    }
    
    func toDict()-> NSDictionary {
        return [
            "name": name,
            "year" : year,
            "navColor": navColor,
            "bkgColor": bkgColor,
            "accentColor": accentColor,
        ]
    }
    
    func saveRef(_ name:String, dict:AnyObject, ref:DatabaseReference) {
        self.candidateRef = ref.child(self.name)
    }
}

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

final class Configuration: NSObject {
    var name:String=""
    var year:String=""
    var navColor:String=""
    var bkgColor:String=""
    var accentColor:String=""
    var orgs:[String]
//    var logo:UIImage=UIImage(named:"logo")!
    var ref:DatabaseReference!
    
    static let sharedConfig = Configuration()
    
    // TODO: add logo param
    // MARK: Initialization
    private init(name: String, year:String, navColor:String, bkgColor:String, accentColor:String, orgs: [String]) {
        // Initialize stored properties.
        self.name = name
        self.year = year
        self.navColor = navColor
        self.bkgColor = bkgColor
        self.accentColor = accentColor
        self.orgs = orgs;
    }
    
    private override convenience init() {
        self.init(name: "", year:"", navColor:"", bkgColor:"", accentColor: "", orgs: [])
    }
    
    func getConfigsFromFirebase(completion: @escaping ((_ data: [String]) -> Void)) {
        if self.orgs.count == 0 {
            print("making database call..")
            ref = Database.database().reference()
            ref = ref?.child("configuration")
            
            ref?.observeSingleEvent(of: .value, with: { snapshot in
                let value = snapshot.value as? NSDictionary
                self.name = (value?["name"] as? String)!
                self.orgs = value?["orgs"] as? NSArray as! [String]
                self.year = (value?["year"] as? String)!
                completion(self.orgs)
            }) { error in
                print(error.localizedDescription)
            }
        } else {
            completion(self.orgs)
        }
    }
    
    func toDict()-> NSDictionary {
        return [
            "name": name,
            "year" : year,
            "navColor": navColor,
            "bkgColor": bkgColor,
            "accentColor": accentColor,
        ]
    }
    
//    func saveRef(_ name:String, dict:AnyObject, ref:DatabaseReference) {
//        self.configurationRef = ref.child(self.name)
//    }
}

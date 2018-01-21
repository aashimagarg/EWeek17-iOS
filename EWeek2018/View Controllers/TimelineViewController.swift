//
//  TimelineViewController.swift
//  EWeek2018
//
//  Created by Aashima Garg on 12/29/17.
//  Copyright © 2017 SEC. All rights reserved.
//

import UIKit
import TwitterKit

class TimelineViewController: TWTRTimelineViewController, TWTRTweetViewDelegate  {
    convenience init() {
        let dataSource = TWTRSearchTimelineDataSource(searchQuery: "#puppies", apiClient: TWTRAPIClient())
        self.init(dataSource: dataSource)
        
//        // To match the events view controller
//        view.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        
        // Show Tweet actions
        showTweetActions = true
    }
}

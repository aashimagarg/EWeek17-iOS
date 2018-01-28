//
//  ScheduleViewController.swift
//  EWeek2018
//
//  Created by Aashima Garg on 12/26/17.
//  Copyright © 2017 SEC. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self;
        tableView.register(UINib(nibName: "EventCell", bundle: nil), forCellReuseIdentifier: "eventcell")
        tableView.register(UINib(nibName: "DateCell", bundle: nil), forCellReuseIdentifier: "datecell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row % 5 == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "datecell", for: indexPath) as! DateCell
            return cell;
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "eventcell", for: indexPath) as! EventCell
            return cell;
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

}


//
//  DateCell.swift
//  EWeek2018
//
//  Created by Aashima Garg on 1/28/18.
//  Copyright © 2018 SEC. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dotView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

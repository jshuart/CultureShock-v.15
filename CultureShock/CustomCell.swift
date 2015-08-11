//
//  CustomCell.swift
//  CultureShock
//
//  Created by Joe Shuart on 8/1/15.
//  Copyright (c) 2015 Joe Shuart. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet var lbl_day_value: UILabel!
    @IBOutlet var lbl_class_time_final: UILabel!
    @IBOutlet var lbl_flex_header_value: UILabel!
    @IBOutlet var lbl_title: UILabel!
    @IBOutlet var lbl_ages_value: UILabel!
    @IBOutlet var lbl_footer_value: UILabel!
    @IBOutlet var lbl_flex_footer_value: UILabel!
    @IBOutlet var lbl_instructor_nid: UILabel!
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

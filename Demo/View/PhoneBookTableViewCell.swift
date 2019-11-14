//
//  PhoneBookTableViewCell.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/5/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit

class PhoneBookTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName1: UILabel!
    
    @IBOutlet weak var imgAvatar: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

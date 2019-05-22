//
//  AddressListTableViewCell.swift
//  viper-ios-intro
//
//  Created by Akash Kundu on 5/21/19.
//  Copyright © 2019 Akash Kundu. All rights reserved.
//

import UIKit

class AddressListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addessLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

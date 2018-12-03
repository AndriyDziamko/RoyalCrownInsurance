//
//  PersonalTableViewCell.swift
//  RoyalCrownInsurance
//
//  Created by Andriy on 12/1/18.
//  Copyright © 2018 Andriy Dziamko. All rights reserved.
//

import UIKit

class PersonalTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    func configure(with personal: Services) {
        
        titleLabel.text = personal.title
        
        
    }

}

//
//  WhatToDoTableViewCell.swift
//  RoyalCrownInsurance
//
//  Created by Andriy on 12/1/18.
//  Copyright © 2018 Andriy Dziamko. All rights reserved.
//

import UIKit

class WhatToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var accidentLabel: UILabel!
    
    func configure(with accident: Accident) {
        
        accidentLabel.text = accident.title
        
        
    }

}

//
//  DatailPersonal.swift
//  RoyalCrownInsurance
//
//  Created by Andriy on 12/1/18.
//  Copyright © 2018 Andriy Dziamko. All rights reserved.
//

import UIKit

class DatailPersonal: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var titleDatail: String = ""
    var descriptionDatail: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        titleLabel.text = titleDatail
        descriptionTextView.text = descriptionDatail
        // Do any additional setup after loading the view.
    }
    
    
    

    
}

//
//  DatailAccidentViewController.swift
//  RoyalCrownInsurance
//
//  Created by Andriy on 12/1/18.
//  Copyright © 2018 Andriy Dziamko. All rights reserved.
//

import UIKit

class DatailAccidentViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonTabOne: UIButton!
    @IBOutlet weak var buttonTabTwo: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    var title1: String = ""
    var tabs: Bool = true
    var tab_1_title: String = ""
    var tab_1_content: String = ""
    var tab_2_title: String = ""
    var tab_2_content: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = title1
        textView.text = "\(tab_1_content)"
        buttonTabOne.tintColor = #colorLiteral(red: 0.08714484423, green: 0.0692500174, blue: 0.3968182206, alpha: 1)
        
        if tabs == true {
           buttonTabOne.setTitle(tab_1_title, for: .normal)
           buttonTabTwo.setTitle(tab_2_title, for: .normal)
            buttonTabTwo.backgroundColor = #colorLiteral(red: 0.08714484423, green: 0.0692500174, blue: 0.3968182206, alpha: 1)
            buttonTabTwo.tintColor = .white
            
            
            
        } else {
          buttonTabOne.setTitle(tab_1_title, for: .normal)
          buttonTabTwo.isHidden = true
            
        }
        
    }
    @IBAction func buttonOnePressed(_ sender: Any) {
        textView.text = "\(tab_1_content)"
        
        buttonTabOne.backgroundColor = .white
        buttonTabOne.tintColor = #colorLiteral(red: 0.08714484423, green: 0.0692500174, blue: 0.3968182206, alpha: 1)
        
        
        buttonTabTwo.backgroundColor = #colorLiteral(red: 0.08714484423, green: 0.0692500174, blue: 0.3968182206, alpha: 1)
        buttonTabTwo.tintColor = .white
    }
    
    @IBAction func buttonTwoPressed(_ sender: Any) {
        textView.text = "\(tab_2_content)"
        
        buttonTabTwo.backgroundColor = .white
        buttonTabTwo.tintColor = #colorLiteral(red: 0.08714484423, green: 0.0692500174, blue: 0.3968182206, alpha: 1)

        
        buttonTabOne.backgroundColor = #colorLiteral(red: 0.08714484423, green: 0.0692500174, blue: 0.3968182206, alpha: 1)
        buttonTabOne.tintColor = .white
    }
    
}

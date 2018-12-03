//
//  ViewController.swift
//  RoyalCrownInsurance
//
//  Created by Andriy on 11/29/18.
//  Copyright © 2018 Andriy Dziamko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "main_logo")
        self.navigationItem.titleView  = UIImageView(image: image)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    


}


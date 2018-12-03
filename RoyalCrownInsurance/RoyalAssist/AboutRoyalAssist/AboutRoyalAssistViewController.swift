//
//  AboutRoyalAssistViewController.swift
//  RoyalCrownInsurance
//
//  Created by Andriy on 11/30/18.
//  Copyright © 2018 Andriy Dziamko. All rights reserved.
//

import UIKit

class AboutRoyalAssistViewController: UIViewController {

    @IBOutlet weak var textRoyalAssist: UITextView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "red_logo_icon")
        self.navigationItem.titleView  = UIImageView(image: image)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    
    
    func fetchData() {
        guard let url = URL(string: "http://31.131.21.105:82/api/v1/about_royal_assist") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            do {
                let json = try JSONDecoder().decode(AboutUs.self, from: data)
                print(json.about_royal_assist)
                DispatchQueue.main.async {
                    self.textRoyalAssist.text = json.about_royal_assist
                }
            } catch let error  {
                print(error)
            }
            
            
        }.resume()
        
        
    }
    
    
    
    
    struct AboutUs: Decodable {
        let about_royal_assist: String
    }
    
}

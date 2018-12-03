//
//  AboutUs.swift
//  RoyalCrownInsurance
//
//  Created by Andriy on 12/1/18.
//  Copyright © 2018 Andriy Dziamko. All rights reserved.
//

import UIKit

class AboutUs: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abouUsTextView: UITextView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    
    func fetchData() {
        guard let url = URL(string: "http://31.131.21.105:82/api/v1/about_us") else {return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            do {
                let aboutus = try JSONDecoder().decode(AboutUs.self, from: data)
                
                DispatchQueue.main.async {
                    self.abouUsTextView.text = aboutus.about_us
                }
            } catch let error  {
                print(error)
            }
            
            
            }.resume()
        
        
    }
    
    struct AboutUs: Decodable {
        let about_us: String
    }
    

    

}

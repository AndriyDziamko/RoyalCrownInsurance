//
//  BranchesMapViewController.swift
//  RoyalCrownInsurance
//
//  Created by Andriy on 11/29/18.
//  Copyright © 2018 Andriy Dziamko. All rights reserved.
//

import UIKit
import GoogleMaps

class BranchesMapViewController: UIViewController,GMSMapViewDelegate {
//AIzaSyAiBAgPA99e1C3HlH5AL_lUSsIuBZcYxvA
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var infoAdress: UITextView!
    
    @IBOutlet weak var google_maps: GMSMapView!
    
    var office: [Office] = []
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "main_logo")
        self.navigationItem.titleView  = UIImageView(image: image)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        
        
        getData()
        
        

       
        


    }
    
 
    
    
    
    
    
   
    func jsonGet(json: [Office])  {
        func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
            
            
            
            
            
        }
        
        var office: [Office] = json
        
        DispatchQueue.main.async {
            let camera = GMSCameraPosition.camera(withLatitude: 35.1655379384343, longitude: 33.3601695857942, zoom: 8)
            self.google_maps.camera = camera
            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: office[0].latitude, longitude: office[0].longitude)
            marker.title = office[0].title
            marker.snippet = "Cyprus"
            marker.icon = UIImage(named: "pin_active_icon")
            marker.map = self.google_maps
            
            let marker1 = GMSMarker()
            marker1.position = CLLocationCoordinate2D(latitude: office[1].latitude, longitude: office[1].longitude)
            marker1.title = office[1].title
            marker1.snippet = "Cyprus"
            marker1.icon = UIImage(named: "pin_active_icon")
            marker1.map = self.google_maps
            
            let marker2 = GMSMarker()
            marker2.position = CLLocationCoordinate2D(latitude: office[2].latitude, longitude: office[2].longitude)
            marker2.title = office[2].title
            marker2.snippet = "Cyprus"
            marker2.icon = UIImage(named: "pin_active_icon")
            marker2.map = self.google_maps
            
            
            mapView(self.google_maps, didTapAt: marker2.position)
            
            
            
            
            if self.google_maps.selectedMarker?.title == marker.title {
                
                self.labelTitle.text = office[0].title
                self.infoAdress.text = """
                Adress: \(office[0].address)
                \(office[0].postal_code)
                T: \(office[0].phone)
                F: \(office[0].fax)
                E: \(office[0].email)
                """
    
                
                
            }
            
            }
            
          
        
        

        
        
        
       
        
        
    }
        
   
    
    
    
    
    
     private func getData() {
        
        
        
        guard let url = URL(string: "http://31.131.21.105:82/api/v1/branches") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data   else { return }
            
            do {
                let json =  try JSONDecoder().decode([Office].self, from: data)
                self.office = json
                self.jsonGet(json: json)
                
                
                
                
            } catch let error {
                print(error.localizedDescription)
            }
            
            
            
            
            }.resume()
        
    }
 
    
   
    

}

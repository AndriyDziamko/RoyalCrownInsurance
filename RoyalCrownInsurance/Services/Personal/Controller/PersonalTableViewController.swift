//
//  PersonalTableViewController.swift
//  RoyalCrownInsurance
//
//  Created by Andriy on 12/1/18.
//  Copyright © 2018 Andriy Dziamko. All rights reserved.
//

import UIKit

class PersonalTableViewController: UITableViewController {
    

    var personal: [Services] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    
    private func getData() {
        
        
        
        guard let url = URL(string: "http://31.131.21.105:82/api/v1/services") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data   else { return }
            
            do {
                let json  =  try JSONDecoder().decode([Services].self, from: data)
                for service in json {
                    
                    if service.type == "personal" {
                        self.personal.append(service)
                        
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
               
                
            } catch let error {
                print(error.localizedDescription)
            }
            
            
            
            }.resume()
      
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personal.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonalTableViewCell
       
        let personals = personal[indexPath.row]
        
        cell.configure(with: personals)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! DatailPersonal
                dvc.descriptionDatail = personal[indexPath.row].description
                dvc.titleDatail = personal[indexPath.row].title
            }
        }
        
        
    }
    

    

  

    

    
    
    
    

}


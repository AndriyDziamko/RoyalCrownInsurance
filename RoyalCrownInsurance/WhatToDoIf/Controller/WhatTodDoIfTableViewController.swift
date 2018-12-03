//
//  WhatTodDoIfTableViewController.swift
//  RoyalCrownInsurance
//
//  Created by Andriy on 12/1/18.
//  Copyright © 2018 Andriy Dziamko. All rights reserved.
//

import UIKit

class WhatTodDoIfTableViewController: UITableViewController {
    
    
    var whatToDoIf: [Accident] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

        
        
        
        
    }
    
    private func getData() {
        
        
        
        guard let url = URL(string: "http://31.131.21.105:82/api/v1/accident_instructions") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data   else { return }
            
            do {
                self.whatToDoIf =  try JSONDecoder().decode([Accident].self, from: data)
                
                
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
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
        return whatToDoIf.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "whatToDoCell", for: indexPath) as! WhatToDoTableViewCell
        
        let value = whatToDoIf[indexPath.row]
        
        cell.configure(with: value)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "whatSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! DatailAccidentViewController
                dvc.title1 = whatToDoIf[indexPath.row].title
                dvc.tabs = whatToDoIf[indexPath.row].tabs
                dvc.tab_1_title = whatToDoIf[indexPath.row].tab_1_title
                dvc.tab_1_content = whatToDoIf[indexPath.row].tab_1_content
                dvc.tab_2_title = whatToDoIf[indexPath.row].tab_2_title
                dvc.tab_2_content = whatToDoIf[indexPath.row].tab_2_content
                
            }
        }
        
        
    }
   

  

   
    
    
    
    

}

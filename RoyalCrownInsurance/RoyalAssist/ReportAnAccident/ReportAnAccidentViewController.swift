//
//  ReportAnAccidentViewController.swift
//  RoyalCrownInsurance
//
//  Created by Andriy on 11/29/18.
//  Copyright © 2018 Andriy Dziamko. All rights reserved.
//

import UIKit

class ReportAnAccidentViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var carReg: UITextField!
    @IBOutlet weak var telNo: UITextField!
    @IBOutlet weak var buttonSwitch: UISwitch!
    @IBOutlet weak var agreeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var reportButton: UIButton!
    
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesighn()
        reportButton.isHidden = true
        buttonSwitch.isOn = false
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    @IBAction func switchPress(_ sender: Any) {
        
        if buttonSwitch.isOn {
            reportButton.isHidden = false
        } else {
            reportButton.isHidden = true
        }
    }
    
    
    
    
    
    
    
    
    func configureDesighn() {
        let image = UIImage(named: "red_logo_icon")
        self.navigationItem.titleView  = UIImageView(image: image)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        imageView.image = UIImage(named: "placeholder")
        name.layer.cornerRadius = 5
        name.layer.borderWidth = 1
        name.layer.borderColor = #colorLiteral(red: 0.2614680529, green: 0.2481251955, blue: 0.394565016, alpha: 1)
        carReg.layer.cornerRadius = 5
        carReg.layer.borderWidth = 1
        carReg.layer.borderColor = #colorLiteral(red: 0.2614680529, green: 0.2481251955, blue: 0.394565016, alpha: 1)
        telNo.layer.cornerRadius = 5
        telNo.layer.borderWidth = 1
        telNo.layer.borderColor = #colorLiteral(red: 0.2614680529, green: 0.2481251955, blue: 0.394565016, alpha: 1)
        agreeLabel.layer.cornerRadius = 5
        agreeLabel.layer.borderWidth = 1
        agreeLabel.layer.borderColor = #colorLiteral(red: 0.2614680529, green: 0.2481251955, blue: 0.394565016, alpha: 1)
        
    }
    
    
    
    
    
    @IBAction func reportAccident(_ sender: Any) {
        
        let report = ReportAccident(name: name.text!, reg_policy_number: telNo.text!, phone_number: carReg.text!)
        
        
        let dic = ["name": report.name,
                   "phone_number": report.phone_number,
                   "reg_policy_number": report.reg_policy_number]
        
        
        
        guard let url = URL(string: "http://31.131.21.105:82/api/v1/accident_reports") else {return}
        
        let userData = dic
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let bodyHttp = try? JSONSerialization.data(withJSONObject: userData, options: []) else {  return }
        request.httpBody = bodyHttp
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let response = response else {return}
            

        }.resume()
        
        
        
    }
    
    
    
    struct ReportAccident {
        var name: String
        var reg_policy_number: String
        var phone_number: String
        
    }

    
}
    
    
    















extension ReportAnAccidentViewController: UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func pressedButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Источник фотографии", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Камера", style: .default) { (action) in
            self.chooseImagePickerAction(source: .camera)
        }
        let photoLibAction = UIAlertAction(title: "Фото", style: .default) { (action) in
            self.chooseImagePickerAction(source: .photoLibrary)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    func chooseImagePickerAction(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
}

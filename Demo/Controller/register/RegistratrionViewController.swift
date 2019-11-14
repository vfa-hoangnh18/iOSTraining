//
//  RegistratrionViewController.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/5/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit

class RegistratrionViewController: BaseViewController, UIPickerViewDelegate,
UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let arraySex = ["Male","Female","Other"]
        return arraySex[row]
    }
    
    
    var email : String!
    var password : String!
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.text = email
        txtPassword.text = password
        
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegisterOnClicked(_ sender: Any) {
        let message = "Info: \(String(txtEmail.text!)) \(String(txtPassword.text!)) \(String(txtName.text!)) \(String(txtAddress.text!))"
        let alert = UIAlertController(title: "Registration", message: message, preferredStyle: UIAlertController.Style.alert)
        let btnOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            
        }
        alert.addAction(btnOk)
        present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

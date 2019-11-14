//
//  Demo1ViewController.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/11/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit

class Demo1ViewController: BaseViewController, UIPickerViewDataSource,
UIPickerViewDelegate
{
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBAction func slider16(_ sender: UISlider) {
        showToast(message: String(sender.value))
    }
    
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        var msg = "Date: " + sender.date.asString(style: .full)
        
        
        let date = sender.date

        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute], from: date)
        let hour = comp.hour
        let minute = comp.minute
        
        msg += "\nTime: \(hour!) : \(minute!)"
        //msg += (String(hour!) + ":" + String(minute!))
        showToast(message: msg)
    }
    
    
    
    let rowOfPickerView = 3
    let dataPickerView = ["Number 1", "Number 2", "Number 3"]
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rowOfPickerView
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataPickerView[row]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        showToast(message: dataPickerView[row])
    }

    

    @IBOutlet weak var label11: UILabel!
    
    @IBAction func switch12(_ sender: UISwitch) {
        showToast(message: (sender.isOn) ? "ON" :  "OFF")
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapLabel11 = UITapGestureRecognizer(target: self, action: #selector(Demo1ViewController.tapLabel11Function))
        label11.isUserInteractionEnabled = true
        label11.addGestureRecognizer(tapLabel11)
        
        pickerView.dataSource = self
        pickerView.delegate = self
       
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for:.valueChanged)
    }
    @IBAction func segmentedControlValueChanged(segment: UISegmentedControl){
        showToast(message: String(segment.selectedSegmentIndex))
    }
    @IBAction func tapLabel11Function(sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: UIAlertController.Style.alert)
         let btnOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
             self.showToast(message: "OK Clicked")
            
         }
         let btnCancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (UIAlertAction) in
             self.showToast(message: "Cancel clicked")
         }
         
        
         alert.addTextField { (textField) in
             textField.placeholder = "This is text field"
             
         }
         alert.addAction(btnOk)
         alert.addAction(btnCancel)
         present(alert, animated: true, completion: nil)
    }
    

    

}

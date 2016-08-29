//
//  SettingsViewController.swift
//  test
//
//  Created by Andreas Beasley on 8/27/16.
//  Copyright © 2016 Andreas Beasley. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var defaultPercentagePicker: UIPickerView!
    
    let percentagesAvail = [
        "10",
        "15",
        "20"
    ]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultTip = defaults.integer(forKey: "defaultTip")
        
        if defaultTip != 0 {
            defaultPercentagePicker.selectRow(defaultTip - 1, inComponent: 0, animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(percentagesAvail[row])%"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        defaults.set(row + 1, forKey: "defaultTip")
    }

}

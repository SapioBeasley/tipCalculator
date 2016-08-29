//
//  ViewController.swift
//  test
//
//  Created by Andreas Beasley on 8/23/16.
//  Copyright © 2016 Andreas Beasley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billInput: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentages: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {

        let defaultTip = defaults.integer(forKey: "defaultTip")
        
        if defaultTip != 0 {
            percentages.selectedSegmentIndex = defaultTip - 1
        }
        
        calcTip()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapCloseKeyboard(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        calcTip()
    }
    
    func calcTip(){
        let tipPercentages = [0.1,0.15,0.2]
        let bill = Double(billInput.text!) ?? 0
        let tip = bill * tipPercentages[percentages
            .selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}


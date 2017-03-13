//
//  ViewController.swift
//  tippy
//
//  Created by Tran, Leland on 3/13/17.
//  Copyright © 2017 Tran, Leland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tip1 = Double(defaults.double(forKey: "tip1"))
        let tip2 = Double(defaults.double(forKey: "tip2"))
        let tip3 = Double(defaults.double(forKey: "tip3"))
        let tip1Title = String(format: "%.0f%%", tip1*100)
        let tip2Title = String(format: "%.0f%%", tip2*100)
        let tip3Title = String(format: "%.0f%%", tip3*100)
        tipControl.setTitle(tip1Title, forSegmentAt: 0)
        tipControl.setTitle(tip2Title, forSegmentAt: 1)
        tipControl.setTitle(tip3Title, forSegmentAt: 2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        let tip1 = Double(defaults.double(forKey: "tip1"))
        let tip2 = Double(defaults.double(forKey: "tip2"))
        let tip3 = Double(defaults.double(forKey: "tip3"))
        
        let tipPercentages = [tip1, tip2, tip3]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onChange(_ sender: Any) {
        calculateTip(sender)
    }


}


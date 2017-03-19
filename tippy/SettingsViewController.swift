//
//  SettingsViewController.swift
//  tippy
//
//  Created by Tran, Leland on 3/13/17.
//  Copyright © 2017 Tran, Leland. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip3Field: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipControlView: UIView!
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let tip1 = defaults.double(forKey: "tip1")
        let tip2 = defaults.double(forKey: "tip2")
        let tip3 = defaults.double(forKey: "tip3")
        tip1Field.text = "\(tip1)"
        tip2Field.text = "\(tip2)"
        tip3Field.text = "\(tip3)"
        let tip1Title = String(format: "%.0f%%", tip1*100)
        let tip2Title = String(format: "%.0f%%", tip2*100)
        let tip3Title = String(format: "%.0f%%", tip3*100)
        tipControl.setTitle(tip1Title, forSegmentAt: 0)
        tipControl.setTitle(tip2Title, forSegmentAt: 1)
        tipControl.setTitle(tip3Title, forSegmentAt: 2)
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        UIView.animate(withDuration: 0.75, animations: {
            self.tipControlView.center.y = 355
        })
        view.endEditing(true)
    }
    
    @IBAction func onTip1TouchDown(_ sender: Any) {
        UIView.animate(withDuration: 0.75, animations: {
            self.tipControlView.center.y = 285
        })
    }
    @IBAction func onTip2TouchDown(_ sender: Any) {
        UIView.animate(withDuration: 0.75, animations: {
            self.tipControlView.center.y = 285
        })
    }
    
    @IBAction func onTip3TouchDown(_ sender: Any) {
        UIView.animate(withDuration: 0.75, animations: {
            self.tipControlView.center.y = 285
        })
    }
    @IBAction func onTip1Change(_ sender: Any) {
        let tip1 = Double(tip1Field.text!) ?? 0.18
        let defaults = UserDefaults.standard
        defaults.set(tip1, forKey: "tip1")
        defaults.synchronize()
        
        let tip1Title = String(format: "%.0f%%", tip1*100)
        tipControl.setTitle(tip1Title, forSegmentAt: 0)
    }
    
    @IBAction func onTip2Change(_ sender: Any) {
        let tip2 = Double(tip2Field.text!) ?? 0.20
        let defaults = UserDefaults.standard
        defaults.set(tip2, forKey: "tip2")
        defaults.synchronize()
        
        let tip2Title = String(format: "%.0f%%", tip2*100)
        tipControl.setTitle(tip2Title, forSegmentAt: 1)
    }
    
    @IBAction func onTip3Change(_ sender: Any) {
        let tip3 = Double(tip3Field.text!) ?? 0.25
        let defaults = UserDefaults.standard
        defaults.set(tip3, forKey: "tip3")
        defaults.synchronize()
        
        let tip3Title = String(format: "%.0f%%", tip3*100)
        tipControl.setTitle(tip3Title, forSegmentAt: 2)
    }
    
    @IBAction func onControlChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        let selectedIndex = tipControl.selectedSegmentIndex
        defaults.set(selectedIndex, forKey: "defaultTip")
        defaults.synchronize()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

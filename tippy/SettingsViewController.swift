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
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let tip1 = defaults.double(forKey: "tip1")
        let tip2 = defaults.double(forKey: "tip2")
        let tip3 = defaults.double(forKey: "tip3")
        tip1Field.text = "\(tip1)"
        tip2Field.text = "\(tip2)"
        tip3Field.text = "\(tip3)"
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
        view.endEditing(true)
    }
    
    @IBAction func onTip1Change(_ sender: Any) {
        let tip1 = Double(tip1Field.text!) ?? 0.18
        let defaults = UserDefaults.standard
        defaults.set(tip1, forKey: "tip1")
        defaults.synchronize()
    }
    
    @IBAction func onTip2Change(_ sender: Any) {
        let tip2 = Double(tip2Field.text!) ?? 0.20
        let defaults = UserDefaults.standard
        defaults.set(tip2, forKey: "tip2")
        defaults.synchronize()
    }
    
    @IBAction func onTip3Change(_ sender: Any) {
        let tip3 = Double(tip3Field.text!) ?? 0.25
        let defaults = UserDefaults.standard
        defaults.set(tip3, forKey: "tip3")
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

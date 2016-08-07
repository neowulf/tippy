//
//  SettingsViewController.swift
//  tippy
//
//  Created by Siva Kommuri on 8/7/16.
//  Copyright © 2016 Siva Kommuri. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipPicker: UIPickerView!
    
    let tips = ["15%", "20%", "25%"]

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("defaultTipIdx")
        defaultTipPicker.selectRow(intValue, inComponent: 0, animated: animated)
    }    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tips.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(row, forKey: "defaultTipIdx")
        defaults.synchronize()
        
        return tips[row]
    }
}
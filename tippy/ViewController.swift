//
//  ViewController.swift
//  tippy
//
//  Created by Siva Kommuri on 8/5/16.
//  Copyright © 2016 Siva Kommuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!

    let tipPercentages = [0.15, 0.2, 0.25]
    
    @IBAction func calculateTip(sender: AnyObject) {
        calculate()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("defaultTipIdx") ?? 0
        tipControl.selectedSegmentIndex = intValue
        
        calculate()
        print("view will appear")
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    func calculate() {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}


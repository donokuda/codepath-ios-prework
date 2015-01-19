//
//  ViewController.swift
//  tips
//
//  Created by Don Okuda on 1/17/15.
//  Copyright (c) 2015 Don Okuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var totalView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        totalView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        if billField.text == "" {
            UIView.animateWithDuration(0.4,
                animations: {
                    self.totalView.alpha = 0
                    self.billView.center.y = 243
                    self.totalView.center.y = 360
                }
            )
        } else {
            UIView.animateWithDuration(0.4, animations: {
                self.totalView.alpha = 1
                self.billView.center.y = 175
                self.totalView.center.y = 300
            })
        }
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}


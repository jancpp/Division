//
//  ViewController.swift
//  Division
//
//  Created by Jan Polzer on 6/3/18.
//  Copyright © 2018 Apps KC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let calculatorBrain = CalculatorBrain()
    let onlineCalc = OnlineCalculatorBrain()
    
    @IBOutlet weak var div1TextField: UITextField!
    @IBOutlet weak var div2TextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func calculateButton(_ sender: UIButton) {
        if div1TextField.text != nil && div2TextField.text != nil {
            if let div1 = Int(div1TextField.text!), let div2 = Int(div2TextField.text!) {
            calculatorBrain.divideTwoNumbers(dividend: div1, divisor: div2) { (result, error) in
                    if error == nil {
                        let numFormatter = NumberFormatter()
                        numFormatter.numberStyle = .decimal
                        resultLabel.text = numFormatter.string(from: result! as NSNumber)
                    }
                }
            }
        }
    }
}


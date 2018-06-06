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
    
    @IBOutlet weak var div1TextField: UITextField!
    @IBOutlet weak var div2TextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func calculateButton(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


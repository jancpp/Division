//
//  CalculatorBrain.swift
//  Division
//
//  Created by Jan Polzer on 6/5/18.
//  Copyright © 2018 Apps KC. All rights reserved.
//

import UIKit

class CalculatorBrain: NSObject {
    func divideTwoNumbers(dividend:Int, divisor:Int, completion:((_ result: Float?, _ error: NSError?) -> Void)) {
        Thread.sleep(forTimeInterval: 1)
        if divisor == 0 {
            let error = NSError(domain: "Error dividing by zero", code: 1, userInfo: nil)
            return completion(nil, error)
        }
        return completion( ( Float(dividend) / Float(divisor) ), nil)
    }
}

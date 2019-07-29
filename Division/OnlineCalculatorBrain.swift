//
//  OnlineCalculatorBrain.swift
//  Division
//
//  Created by Jan Polzer on 6/6/18.
//  Copyright © 2018 Apps KC. All rights reserved.
//

import UIKit

class OnlineCalculatorBrain: NSObject {
    
    func retrieveURLForDivison(dividend divident: Int, divisor: Int) -> NSURL {
        return NSURL(string:"https://www.calcatraz.com/calculator/api?c=\(divident)%2F\(divisor)")!
    }
    
    func calulateWithTwoNumbers(dividend: Int, divisor: Int, completionHandler: @escaping (Float?, NSError?) -> ()) {
        let url = retrieveURLForDivison(dividend: dividend, divisor: divisor)
        let session = URLSession.shared
        let task = session.dataTask(with: url as URL) { (data, response, error) in
            if error == nil {
                if let data = data {
                    let sValue = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    let fValue = sValue?.floatValue
                    if fValue == nil || sValue!.length > 10 {
                        let error = NSError(domain: "Division by zero", code: 1, userInfo: nil)
                        return completionHandler(nil, error)
                    }
                    return completionHandler(sValue?.floatValue, nil)
                }
                let localError = NSError(domain: "No data was found", code: 1, userInfo: nil)
                return completionHandler(nil, localError as NSError?)
            } else {
                print(error?.localizedDescription ?? "Localized Error")
                return completionHandler(nil, error as NSError?)
            }
            
        }
        task.resume()
    }
}


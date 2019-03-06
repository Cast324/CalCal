//
//  CalcModel.swift
//  CalCal
//
//  Created by Michael Blades on 3/5/19.
//  Copyright © 2019 Michael Blades. All rights reserved.
//

import UIKit

class CalcModel: NSObject {
    
    enum operators {
        case plus
        case minus
        case multiply
        case divide
        case none
    }
    
    var operand1:Double? = nil
    var operand2:Double? = nil
    
    var mathOperation:operators = .none
    
    func divideOperation(num1:Double, divideByNum:Double) -> String {
        if divideByNum == 0 {
            return "0"
        } else {
            return "\(num1 / divideByNum)"
        }
    }
    
    func multiplyOperation(num1:Double, multiplyerNum:Double) -> String {
        return "\(num1 * multiplyerNum)"
    }
    
    func plusOperation(operator1:Double, operator2:Double) -> String {
        return "\(operator1 + operator2)"
    }
    
    func minusOperation(num1:Double, minsByNum:Double) -> String {
        return "\(num1 - minsByNum)"
    }
    
    func clearOperators() {
        operand1 = nil
        operand2 = nil
        
        mathOperation = .none
    }
    
    func performOperation() -> String {
        var returnString = ""
        switch mathOperation {
        case .plus:
            returnString = plusOperation(operator1: operand1 ?? 0, operator2: operand2 ?? 0)
        case .minus:
            returnString = minusOperation(num1: operand1 ?? 0, minsByNum: operand2 ?? 0)
        case .divide:
            returnString = divideOperation(num1: operand1 ?? 0, divideByNum: operand2 ?? 0)
        case .multiply:
            returnString = multiplyOperation(num1: operand1 ?? 0, multiplyerNum: operand2 ?? 0)
        default:
            print("You found a Bug!!!!")
        }
        
        return returnString
    }
    
    

}

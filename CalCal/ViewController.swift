//
//  ViewController.swift
//  CalCal
//
//  Created by  on 2/26/19.
//  Copyright © 2019 Michael Blades. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    let calcModel = CalcModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numPressed(_ sender: UIButton) {
        updateMainLabel(newNum: (sender.titleLabel?.text)!)
    }
    
    @IBAction func functionPressed(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "AC":
            displayLabel.text = "0"
            calcModel.clearOperators()
        case "÷":
            if calcModel.mathOperation == .none {
                sender.backgroundColor = UIColor.gray
                calcModel.operand1 = Double(displayLabel.text!)!
                calcModel.mathOperation = .divide
            }
        case "X":
            if calcModel.mathOperation == .none {
                sender.backgroundColor = UIColor.gray
                calcModel.operand1 = Double(displayLabel.text!)!
                calcModel.mathOperation = .multiply
            }
        case "-":
            if calcModel.mathOperation == .none {
                sender.backgroundColor = UIColor.gray
                calcModel.operand1 = Double(displayLabel.text!)!
                calcModel.mathOperation = .minus
            }
        case "+":
            if calcModel.mathOperation == .none {
                sender.backgroundColor = UIColor.gray
                calcModel.operand1 = Double(displayLabel.text!)!
                calcModel.mathOperation = .plus
            }
        case "=":
            if calcModel.mathOperation != .none {
                calcModel.operand2 = Double(displayLabel.text!)!
                updateMainLabel(newNum: calcModel.performOperation())
                calcModel.clearOperators()
            }
        case "<-":
            if displayLabel.text != "0" {
                if displayLabel.text?.count == 1 {
                    displayLabel.text = "0"
                } else {
                    displayLabel.text?.removeLast()
                }
            }
        default:
            print("How did you do that? Error in Fuctions")
        }
    }
    
    func updateMainLabel(newNum: String) {
        if calcModel.operand1 != nil && calcModel.operand2 != nil {
            displayLabel.text = newNum
        }else if displayLabel.text == "0" && calcModel.operand1 == nil {
            displayLabel.text = newNum
        } else if displayLabel.text != "0" && calcModel.operand1 == nil {
            displayLabel.text?.append(newNum)
        } else {
            if Double(displayLabel.text!) == calcModel.operand1 {
                displayLabel.text = newNum
                switch calcModel.mathOperation {
                case .plus:
                    plusButton.backgroundColor = UIColor.white
                case .divide:
                    divideButton.backgroundColor = UIColor.white
                case .minus:
                    minusButton.backgroundColor = UIColor.white
                case .multiply:
                    multiplyButton.backgroundColor = UIColor.white
                default:
                    print("Error When Update Main Label")
                    
                }
            } else {
                displayLabel.text?.append(newNum)
            }
        }
    }
    
    

}


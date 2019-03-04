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
    
    enum operators {
        case plus
        case minus
        case multiply
        case divide
        case none
    }
    
    var nextOperator:operators = .none
    var operatorToPerform:operators = .none
    
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
        case "+/-":
            displayLabel.text = "+/-"
        case "%":
            displayLabel.text = "%"
        case "÷":
            nextOperator = .divide
            sender.backgroundColor = UIColor.gray
        case "X":
            nextOperator = .multiply
            sender.backgroundColor = UIColor.gray
        case "-":
            nextOperator = .minus
            sender.backgroundColor = UIColor.gray
        case "+":
            nextOperator = .plus
            sender.backgroundColor = UIColor.gray
        case "=":
            displayLabel.text = "="
        case "<-":
            displayLabel.text = "BackSpace"
        default:
            print("How did you do that? Error in Fuctions")
        }
    }
    
    func updateMainLabel(newNum: String) {
        if displayLabel.text == "0"{
            displayLabel.text = newNum
        } else if nextOperator == .none {
            displayLabel.text?.append(newNum)
        } else {
            displayLabel.text = newNum
            switch nextOperator {
            case .plus:
                plusButton.backgroundColor = UIColor.white
                nextOperator = .none
                operatorToPerform = .plus
            case .divide:
                divideButton.backgroundColor = UIColor.white
                nextOperator = .none
                operatorToPerform = .divide
            case .minus:
                minusButton.backgroundColor = UIColor.white
                nextOperator = .none
                operatorToPerform = .minus
            case .multiply:
                multiplyButton.backgroundColor = UIColor.white
                nextOperator = .none
                operatorToPerform = .multiply
            default:
                print("Error When Update Main Label")
                
            }
        }
    }
    
    

}


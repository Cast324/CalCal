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
            displayLabel.text = "+"
        case "X":
            displayLabel.text = "X"
        case "-":
            displayLabel.text = "-"
        case "+":
            displayLabel.text = "+"
        case "=":
            displayLabel.text = "="
        case "<-":
            displayLabel.text = "BackSpace"
        default:
            print("How did you do that?")
        }
    }
    
    func updateMainLabel(newNum: String) {
        if displayLabel.text == "0" {
            displayLabel.text = String(newNum)
        } else {
            displayLabel.text?.append(String(newNum))
        }
    }
    
    

}


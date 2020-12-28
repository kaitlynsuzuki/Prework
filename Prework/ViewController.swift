//
//  ViewController.swift
//  Prework
//
//  Created by Kaitlyn Suzuki on 12/23/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
   
    @IBAction func numOfPeopleAction(_ sender: Any) {
        numOfPeopleLabel.text = String(Int(numOfPeopleStepper.value))
        if numOfPeopleStepper.value == 0
        {
            numOfPeopleStepper.value = 1
            numOfPeopleLabel.text = String(Int(numOfPeopleStepper.value))
        }
    }
    @IBOutlet weak var numOfPeopleStepper: UIStepper!
    @IBOutlet weak var numOfPeopleLabel: UILabel!
    @IBOutlet weak var individualCostLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.becomeFirstResponder()
        numOfPeopleStepper.value = 1
    }

    @IBAction func onTap(_ sender: Any) {
        print("hello!!")
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount
        //?? 0 is error handling, because if there is an issue with converting the string into a double it becomes 0
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        //calculate tip + total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        //calculate individual cost
        var individualCost = total/numOfPeopleStepper.value
        if numOfPeopleStepper.value == 0
        {
            individualCost = total/1
        }
        individualCostLabel.text = String(format: "$%.2f", individualCost)
        //update labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}


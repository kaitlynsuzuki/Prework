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
    //Access UserDefaults
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.becomeFirstResponder()
        numOfPeopleStepper.value = 1
        let defaults = UserDefaults.standard
        let tips = [0.15, 0.18, 0.2]
        // Set a String value for some key.
        defaults.set(tips[0], forKey: "tip1")
        defaults.set(tips[1], forKey: "tip2")
        defaults.set(tips[2], forKey: "tip3")
        defaults.synchronize()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let tipPercentages = [defaults.double(forKey: "tip1"), defaults.double(forKey: "tip2"), defaults.double(forKey: "tip3")]
        for i in 0...2
        {
            let a = String(format: "%d%%", Int((tipPercentages[i]) * 100))
            tipControl.setTitle(a, forSegmentAt: i)
        }
        self.calculateTip("")
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount
        //?? 0 is error handling, because if there is an issue with converting the string into a double it becomes 0
        let bill = Double(billField.text!) ?? 0
        let defaults = UserDefaults.standard
        let tipPercentages = [defaults.double(forKey: "tip1"), defaults.double(forKey: "tip2"), defaults.double(forKey: "tip3")]
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


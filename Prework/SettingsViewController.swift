//
//  SettingsViewController.swift
//  Prework
//
//  Created by Kaitlyn Suzuki on 12/28/20.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaultTips = [0.15, 0.18, 0.2]
    @IBOutlet weak var tip1Field: UITextField!
    
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip3Field: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        tip1Field.text = String(Int(defaults.double(forKey: "tip1") * 100))
        tip2Field.text = String(Int(defaults.double(forKey: "tip2") * 100))
        tip3Field.text = String(Int(defaults.double(forKey: "tip3") * 100))
        tip1Field.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    

    @IBAction func tip1Change(_ sender: Any) {
        let defaults = UserDefaults.standard
        var tip1 = Double(tip1Field.text!) ?? 15
        tip1 = tip1 * 0.01
        defaults.set(tip1, forKey: "tip1")
        defaults.synchronize()
        let test = defaults.double(forKey:"tip1")
        print(test)
    }
    
    @IBAction func tip2Change(_ sender: Any) {
        let defaults = UserDefaults.standard
        var tip2 = Double(tip2Field.text!) ?? 18
        tip2 = tip2 * 0.01
        defaults.set(tip2, forKey: "tip2")
        defaults.synchronize()
    }
    
    @IBAction func tip3Change(_ sender: Any) {
        let defaults = UserDefaults.standard
        var tip3 = Double(tip3Field.text!) ?? 20
        tip3 = tip3 * 0.01
        defaults.set(tip3, forKey: "tip3")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

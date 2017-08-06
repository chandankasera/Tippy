//
//  ViewController.swift
//  Tippy
//
//  Created by Chandan Kasera on 8/5/17.
//  Copyright © 2017 Chandan Kasera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    func getCurrencySymbol() -> String {
        let locale = NSLocale.current
        return locale.currencySymbol!
        
    }

   
    @IBAction func tipControlChanged(_ sender: Any) {
        let tipPercent = [0.18, 0.20 , 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill*tipPercent[tipControl.selectedSegmentIndex]
        let total = bill+tip
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
    }
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercent = [0.18, 0.20 , 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill*tipPercent[tipControl.selectedSegmentIndex]
        let total = bill+tip
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        let defaultChanged = defaults.bool(forKey:"defaultChanged")
        if defaultChanged {
        let intValue = defaults.integer(forKey: "defaultPercentIndex")
        tipControl.selectedSegmentIndex = intValue
        }
        print(getCurrencySymbol())
        tipLabel.text=getCurrencySymbol()+"0.00"
        totalLabel.text=getCurrencySymbol()+"0.00"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
         billField.becomeFirstResponder()
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
       
    }
}


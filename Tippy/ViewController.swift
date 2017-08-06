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
    
    func retainBillValue() {
        let defaults = UserDefaults.standard
        defaults.set(billField.text, forKey: "defaults.billValue")
        defaults.set(NSDate(), forKey: "defaults.billDate")
        defaults.synchronize()
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
        retainBillValue()
        let tipPercent = [0.18, 0.20 , 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill*tipPercent[tipControl.selectedSegmentIndex]
        let total = bill+tip
        tipLabel.text = String(format: getCurrencySymbol()+"%.2f",tip)
        totalLabel.text = String(format: getCurrencySymbol()+"%.2f",total)
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
        let refDate = UserDefaults.standard.object(forKey :"defaults.billDate") as? NSDate
        if (refDate != nil && integer_t(NSDate().timeIntervalSince(refDate! as Date)) < 600) {
            billField.text = UserDefaults.standard.object(forKey : "defaults.billValue") as? String
        }
        //reset the tip Label and totalLabel
        calculateTip(self)
        

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


//
//  SettingViewController.swift
//  Tippy
//
//  Created by Chandan Kasera on 8/5/17.
//  Copyright © 2017 Chandan Kasera. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var defaultTipPercent: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = UserDefaults.standard
        
        let intValue = defaults.integer(forKey: "defaultPercentIndex")
        defaultTipPercent.selectedSegmentIndex = intValue
    }
    
    @IBAction func DefaultTipChanged(_ sender: Any) {
        
        let defaults = UserDefaults.standard // Swift 3 syntax, previously NSUserDefaults.standardUserDefaults()
  //      defaults.set("some_string_to_save", forKey: "some_key_that_you_choose")
        defaults.set(defaultTipPercent.selectedSegmentIndex, forKey: "defaultPercentIndex")
        defaults.set(true, forKey: "defaultChanged")
        defaults.synchronize()
    }
    

}

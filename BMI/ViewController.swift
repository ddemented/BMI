//
//  ViewController.swift
//  BMI
//
//  Created by Sanjeev Suresh on 5/24/15.
//  Copyright (c) 2015 Sanjeev Suresh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    var height:Double?
    var weight:Double?
    var bmi:Double? {
        get {
            if height != nil && weight != nil {
                return weight!/(height! * height!)
            } else {
                return nil
            }
        }
    }

    @IBOutlet weak var ans: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func updateUI() {
        if let b = self.bmi {
            self.ans.text = String(format: "%4.1f", b)
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        switch(textField) {
        case self.weightTextField:
            //TODO:set weight
            let s = textField.text
            let dv = NSNumberFormatter().numberFromString(s)?.doubleValue
            self.weight = dv
            
        case self.heightTextField:
            //TODO:set height
            let s = textField.text
            let dv = NSNumberFormatter().numberFromString(s)?.doubleValue
            self.height = dv
        default:
            println("Something gone wrong!");
            
        }
    }


}


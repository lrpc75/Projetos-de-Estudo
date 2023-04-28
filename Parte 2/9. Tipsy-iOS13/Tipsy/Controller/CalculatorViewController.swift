//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    var tipPorcent : Float =  0.1
    var splitNumber = 2
    var finalValue : Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipPorcent = 0.0
            
        } else if sender.currentTitle == "10%"{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipPorcent = 0.1
            
        } else if sender.currentTitle == "20%"{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipPorcent = 0.2
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(splitNumber)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        finalValue = ((Float(billTextField.text ?? "0.0") ?? 0.0) * (1.0 + tipPorcent)) / Float(splitNumber)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult",
           let destinationVC = segue.destination as? ResultsViewController{
            
            destinationVC.result = finalValue
            destinationVC.people = splitNumber
            destinationVC.tipsPercentage = String(tipPorcent * 100)
        }
    }
}


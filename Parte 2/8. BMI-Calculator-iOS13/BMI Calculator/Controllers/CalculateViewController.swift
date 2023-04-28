//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlicer: UISlider!
    @IBOutlet weak var weightSlicer: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func heightSlicerChanged(_ sender: UISlider) {
        let height = "\(String(format: "%.2f", sender.value))m"
        heightLabel.text = height
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = "\(String(format: "%.0f", sender.value))Kg"
        weightLabel.text = weight
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlicer.value
        let weight = weightSlicer.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

//
//  CalculatorBrais.swift
//  BMI Calculator
//
//  Created by Usuário on 15/03/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi : BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = (weight / pow(height, 2))
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "You are underweight", color:#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Good weight", color:#colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "You are overweight", color:#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1))
        }
    }
    
    func getBMIValue() -> String{
        return String(format: "%0.1f", bmi?.value ?? "0.0")
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "Error"
    }
    func getColor() -> UIColor{
        return bmi?.color ?? .red
    }
}

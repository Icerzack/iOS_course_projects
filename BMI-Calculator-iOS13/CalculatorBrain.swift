//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Admin on 06.08.2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
import UIKit
struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> Float{
        return bmi?.value ?? 0.0
    }
    
    func getAdvise() -> String{
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    mutating func calculateBMIValue(weight:Float, height:Float){
        let bmiValue =  round(weight/(height*height)*10)/10
        
        if(bmiValue<18.5){
            bmi = BMI(value: bmiValue, advice: "eat more", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
        else if(bmiValue<24.9){
            bmi = BMI(value: bmiValue, advice: "fit as fit", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        }
        else{
            bmi = BMI(value: bmiValue, advice: "eat less", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        }
    }
}

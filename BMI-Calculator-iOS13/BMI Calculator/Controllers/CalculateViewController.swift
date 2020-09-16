//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Foundation
class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var heightValue:Float = 0
    var weightValue:Float = 0
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        if(sender.accessibilityIdentifier == "heightSlider"){
            heightValue = round(sender.value*100)/100
            heightLabel.text = "\(heightValue)m"
                    }
        else {
            weightValue = round(sender.value*10)/10
            weightLabel.text = "\(weightValue)Kg"
        }
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateBMIValue(weight: weightValue, height: heightValue)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.bmiAdvise = calculatorBrain.getAdvise()
            destinationVC.BC = calculatorBrain.getColor()
            
        }
    }
    
}


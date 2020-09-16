//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var time :Float = 0
    var timer = Timer()
    
    var secondsPassed :Float = 0
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        time = Float((eggTimes[sender.currentTitle!]!))
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateCounter() `{
        if secondsPassed<time {
            progressBar.progress = Float(secondsPassed/time)
            myLabel.text = ("\(time-secondsPassed) seconds to the end of the egg")
            
            secondsPassed += 1
        }
        else{
            progressBar.progress = 1.0
            secondsPassed = 0
            timer.invalidate()
            myLabel.text = "Done!"
        }
    }`

}

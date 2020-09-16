//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var counter = 0
    
    let totalTime = 0.2 // это отвечает за время, которое будут светится кнопки
    var timePassed :Double = 0
    
    var timer: Timer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[0].text
        progressBar.progress = 0
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = questions[counter].answer
        
        if(userAnswer == actualAnswer){
            sender.backgroundColor = UIColor.green
            print("Great!")
//            if(progressBar.progress != 1){
                progressBar.progress += 1/12
//            }
        }
        else {
            sender.backgroundColor = UIColor.red
            print("Are you serious?")
//            if(progressBar.progress != 0){
                progressBar.progress -= 1/12
//            }
        }
        
        counter += 1
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: false)
        
        if(counter<questions.count) {
            updateUI(count: counter)
        }
        else {
            print("That's the end: your score is \(round( progressBar.progress*100))%")
            counter = 0 // обнуляем
            progressBar.progress = 0 //обнуляем
            updateUI(count: counter)
        }
        
    }
    
    @objc func updateTimer(){
        if(timePassed>totalTime){
            timer.invalidate()
            trueButton.backgroundColor = UIColor.clear
            falseButton.backgroundColor = UIColor.clear
        }
        else{
            timePassed+=0.2
        }
    }
    
    
    func updateUI(count :Int){
        questionLabel.text = questions[count].text
    }
    
}


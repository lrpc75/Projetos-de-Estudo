//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var textOnScreen: UILabel!
    let eggTime = ["Soft": 300, "Medium": 400, "Hard": 700]
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness =  sender.currentTitle!
        let timeFraccion = 1.0 / Float(eggTime[hardness]!)
        var secondsRemaining = eggTime[hardness]!
        var count = 0
        
        ProgressBar.progress = 0
        timer.invalidate()
        textOnScreen.text = hardness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
                count += 1
                self.ProgressBar.progress = Float(timeFraccion) * Float(count)
                print (Float(timeFraccion) * Float(count))

            } else {
                Timer.invalidate()
                self.textOnScreen.text = "Done!"
                
            }
            
        }

    }
    
}

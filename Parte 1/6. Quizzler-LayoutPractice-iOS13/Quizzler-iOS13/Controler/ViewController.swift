//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var B_One: UIButton!
    @IBOutlet weak var B_Three: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var B_Two: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        updateUI()
        scoreLabel.textColor = UIColor.white
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
      
        let userAnswer = sender.currentTitle!
        var UserGotItRight = quizBrain.checkAnswewr(userAnswer)
        
        if UserGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI () {
        
        questionLabel.text = quizBrain.getQuestionText()
        B_One.setTitle(<#T##String?#>, for: .normal) = quizBrain.updateBottons()
        //B_Two.titleLabel = quizBrain.updateBottons()
        //B_Three.titleLabel = quizBrain.updateBottons()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score:  \(quizBrain.getScore())"
        
        B_One.backgroundColor = UIColor.clear
        B_Two.backgroundColor = UIColor.clear
        B_Three.backgroundColor = UIColor.clear
        
    }
    
    
}


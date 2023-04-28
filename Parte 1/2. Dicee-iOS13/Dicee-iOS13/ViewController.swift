//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
 
    @IBAction func RollButtonPressed(sender: UIButton) {
        
        let diceArray = ["DiceOne", "DiceTwo" ,"DiceThree", "DiceFour", "DiceFive", "DiceSix"]
        // Aqui eu criei um vetor constante com o nome das imagens.
        // Logo abaixo eu defini a imagem do diceImageView1 como uma imagem nomeada: String aleatória do meu vetor (UIImage busca o nome dado nos Assets do app).
        diceImageView1.image = UIImage(named: diceArray.randomElement()!)
        diceImageView2.image = UIImage(named: diceArray.randomElement()!)
        
    }
    
}

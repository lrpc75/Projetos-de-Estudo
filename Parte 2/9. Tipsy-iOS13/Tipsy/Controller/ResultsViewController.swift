//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Usuário on 16/03/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var result = Float(0.0)
    var people = 2
    var tipsPercentage = "0.0"
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(result)
        settingsLabel.text = "Split between \(people), with \(tipsPercentage)% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

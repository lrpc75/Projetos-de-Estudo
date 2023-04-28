//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CoinViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var bitcoinLabel: UIStackView!
   
    var coinManager = CoinManager()
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCoin = (coinManager.currencyArray[row])
        coinManager.getCoinPrice(for: selectedCoin)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self

    }
}

//MARK: - WeatherManagerDelegate

extension CoinViewController: CoinManagerDelegate{
    
    func didUpdateCoinValue(_ coinManager: CoinManager, coin: CoinModel){
        DispatchQueue.main.async {
            self.currencyLabel.text = String(format: "%.7f", coin.coinValue)
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}

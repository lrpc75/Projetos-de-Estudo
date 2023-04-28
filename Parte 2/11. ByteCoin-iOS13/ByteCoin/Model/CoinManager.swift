//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate: AnyObject {
    func didUpdateCoinValue(_ coinManager: CoinManager, coin:CoinModel)
    func didFailWithError(error:Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/"
    let apiKey = "9B108054-32BD-4E6C-B987-FE7169DA2F61"
    weak var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)\(currency)/USD?apikey=\(apiKey)"
        performRequest(urlString: urlString)
    }
    
    let currencyArray = ["BTC", "ETH","AUD","BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {data, response, error in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let coin = self.parseJSON(safeData){
                        self.delegate?.didUpdateCoinValue(self, coin: coin)
                    }
                }
            }
            
                task.resume()
        }
    }
    func parseJSON (_ coinData: Data) -> CoinModel?{
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodeData.rate
            
            let coin = CoinModel(coinValue:rate)
            
            return coin
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

}

//
//  WeatherManager.swift
//  Clima
//
//  Created by Usuário on 17/03/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate: AnyObject {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather:WeatherModel)
    func didFailWithError(error:Error)
}

struct WeatherManager {
    
    weak var delegate: WeatherManagerDelegate?
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=2fd90f587d15e274e1dd5d0c38eb8014&units=metric"
    
    func fetchWeather (cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: urlString)
    }


    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {data, response, error in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
                task.resume()
        }
    }
    func parseJSON (_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let city = decodeData.name
            
            let weather = WeatherModel(conditionId: id, cityName: city, temperature: temp)
            
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

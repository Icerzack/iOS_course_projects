//
//  WeatherManager.swift
//  Clima
//
//  Created by Admin on 13.08.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager :WeatherManager, weather :WeatherModule)
    func didFailWithError (_ error :Error)
}

struct WeatherManager{
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=92666c3fa667126a5234e8552124b8df&units=metric"
    
    func fetchWeather(_ cityName :String) {
        let stringUrl = "\(weatherUrl)&q=\(cityName)"
        performRequest(stringUrl)
    }
    
    var delegate :WeatherManagerDelegate?
    
    func performRequest(_ urlString :String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                if(error != nil){
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData :Data) -> WeatherModule? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weatherID = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName = decodedData.name
            
            let weather = WeatherModule(conditionID: weatherID, cityName: cityName, temperature: temp)
            
            return weather
            
        } catch{
            delegate?.didFailWithError(error)
            return nil
        }
    }
}

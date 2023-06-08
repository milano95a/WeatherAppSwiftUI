//
//  APIManager.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 03/06/23.
//

import Foundation

class APIManager {
    
    static var shared = APIManager()
    
    private init() {}
    
    static let apiKey = ""
    let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Kokand&appid=\(apiKey)&units=metric"
    
    func fetchWeather() async -> WeatherResponse? {
        guard let url = URL(string: urlString) else {
            print("url problem")
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            var weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
            weatherResponse.main.temp = 50
            return weatherResponse
        } catch let error {
            print(error)
            return nil
        }
    }
}

struct WeatherResponse: Codable {
    var weather: [DescriptionDTO]
    var main: WeatherDTO
}

struct DescriptionDTO: Codable {
    var id: Int
    var main: String
}

struct WeatherDTO: Codable {
    var temp: Double
    var temp_min: Double
    var temp_max: Double
}

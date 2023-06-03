//
//  WeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 03/06/23.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    
    @Published private(set) var description: String?
    @Published private(set) var message: String?
    @Published private(set) var temperature: String?
    @Published private(set) var weatherClothing: String?
    @Published private(set) var weatherColor: Color?
    
    private var weather: Weather?
    private let descriptions = [
        1: "Extreme Hot",
        2: "Too Hot",
        3: "Hot",
        4: "Warm",
        5: "Cool",
        6: "Cold",
        7: "Freezing",
        8: "Extreme Cold"
    ]
    private let messages = [
        1: "don't fucking go out",
        2: "let's stay indoors",
        3: "go out if it's important",
        4: "let's go for a walk",
        5: "let's go out",
        6: "go out if it's important",
        7: "let's stay indoors",
        8: "don't fucking go out",
    ]
    private let clothingImages = [
        1: "house",
        2: "t-shirt",
        3: "t-shirt",
        4: "t-shirt",
        5: "shirt",
        6: "jumper",
        7: "jacket",
        8: "house",
    ]
    
    private let colors = [
        1: Color(red: 122/255, green: 32/255, blue: 13/255),
        2: Color(red: 204/255, green: 76/255, blue: 48/255),
        3: Color(red: 211/255, green: 99/255, blue: 75/255),
        4: Color(red: 166/255, green: 229/255, blue: 137/255),
        5: Color(red: 112/255, green: 202/255, blue: 231/255),
        6: Color(red: 60/255, green: 181/255, blue: 220/255),
        7: Color(red: 15/255, green: 125/255, blue: 159/255),
        8: Color(red: 47/255, green: 62/255, blue: 67/255),
    ]
    
    // MARK: Intent(s)
    
    func refresh() async {
        guard let weatherResponse = await APIManager.shared.fetchWeather() else { return }
        let weather = Weather(temp: weatherResponse.main.temp, description: weatherResponse.weather[0].main)
        self.weather = weather
        
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            var weatherScore = 1
            
            switch weather.temp {
            case let x where x <= -10:
                weatherScore = 8
            case -10...0:
                weatherScore = 7
            case 0...10:
                weatherScore = 6
            case 10...20:
                weatherScore = 5
            case 20...30:
                weatherScore = 4
            case 30...40:
                weatherScore = 3
            case 40...50:
                weatherScore = 2
            case let x where x >= 50:
                weatherScore = 1
            default:
                break
            }
            
            description = descriptions[weatherScore]
            message = messages[weatherScore]
            temperature = "\(weather.temp)"
            weatherClothing = clothingImages[weatherScore]
            weatherColor = colors[weatherScore]
        }
    }
}

struct Weather {
    var temp: Double
    var description: String
}


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
    
    private var configuration: WeatherConfiguration
    
    init() {
        if let data = UserDefaults.standard.object(forKey: kConfiguration) as? Data, let configuration = try? JSONDecoder().decode(WeatherConfiguration.self, from: data) {
            self.configuration = configuration
        } else {
            configuration = WeatherConfiguration()
        }
        messages = [
            .extremeHot: configuration.messageExtremeHot,
            .tooHot: configuration.messageTooHot,
            .hot: configuration.messageHot,
            .warm: configuration.messageWarm,
            .cool: configuration.messageCool,
            .cold: configuration.messageCold,
            .freezing: configuration.messageFreezing,
            .extremeCold: configuration.messageExtremeCold
        ]
        NotificationCenter.default.addObserver(self, selector: #selector(configurationDidUpdate), name: configurationUpdated, object: nil)
    }
    
    private var weather: Weather?
    private let descriptions: [WeatherType: String] = [
        .extremeHot: "Extreme Hot",
        .tooHot: "Too Hot",
        .hot: "Hot",
        .warm: "Warm",
        .cool: "Cool",
        .cold: "Cold",
        .freezing: "Freezing",
        .extremeCold: "Extreme Cold"
    ]
    
    private var messages: [WeatherType: String] = [:]
    
    // MARK: Intent(s)
    
    func refresh() async {
        guard let weatherResponse = await APIManager.shared.fetchWeather() else { return }
        let weather = Weather(temp: weatherResponse.main.temp, description: weatherResponse.weather[0].main)
        self.weather = weather
        
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            var weatherType = WeatherType.warm
            
            switch Int(weather.temp) {
            case let temp where temp >= configuration.temperatureExtremeHot:
                weatherType = .extremeHot
            case let temp where temp >= configuration.temperatureTooHot:
                weatherType = .tooHot
            case let temp where temp >= configuration.temperatureHot:
                weatherType = .hot
            case let temp where temp >= configuration.temperatureWarm:
                weatherType = .warm
            case let temp where temp >= configuration.temperatureCool:
                weatherType = .cool
            case let temp where temp >= configuration.temperatureCold:
                weatherType = .cold
            case let temp where temp >= configuration.temperatureFreezing:
                weatherType = .freezing
            default:
                weatherType = .extremeCold
            }
            
            description = descriptions[weatherType]
            message = messages[weatherType]
            temperature = "\(weather.temp)"
            weatherClothing = ImageStorage.images[weatherType]
            weatherColor = ColorStorage.colors[weatherType]
        }
    }
    
    @objc func configurationDidUpdate() {
        load()
        Task {
            await refresh()
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.object(forKey: kConfiguration) as? Data, let configuration = try? JSONDecoder().decode(WeatherConfiguration.self, from: data) {
            self.configuration = configuration
        } else {
            configuration = WeatherConfiguration()
        }
    }
}

struct Weather {
    var temp: Double
    var description: String
}

enum WeatherType: Int, Hashable {
    case extremeCold = 8
    case freezing = 7
    case cold = 6
    case cool = 5
    case warm = 4
    case hot = 3
    case tooHot = 2
    case extremeHot = 1
}

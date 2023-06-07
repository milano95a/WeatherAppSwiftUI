//
//  ConfigurationViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 04/06/23.
//

import SwiftUI

class ConfigurationViewModel: ObservableObject {
    
    @Published var configuration: WeatherConfiguration {
        didSet {
            save()
            sendNotification()
        }
    }
    
    init() {
        if let data = UserDefaults.standard.object(forKey: kConfiguration) as? Data, let configuration = try? JSONDecoder().decode(WeatherConfiguration.self, from: data) {
            self.configuration = configuration
        } else {
            configuration = WeatherConfiguration()
        }
    }
    
    // MARK: Intent(s)
    
    func save() {
        do {
            let json = try JSONEncoder().encode(configuration)
            UserDefaults.standard.set(json, forKey: kConfiguration)
        } catch let error {
            print(error)
        }
    }
    
    private func sendNotification() {
        NotificationCenter.default.post(name: configurationUpdated, object: nil)
    }
}

struct WeatherConfiguration: Codable {
    var temperatureExtremeHot = 45
    var temperatureTooHot = 40
    var temperatureHot = 32
    var temperatureWarm = 20
    var temperatureCool = 10
    var temperatureCold = 0
    var temperatureFreezing = -10
    var temperatureExtremeCold = -20
    var messageExtremeHot = "don't fucking out even if you die"
    var messageTooHot = "do not go out unless you die"
    var messageHot = "go out if it's important"
    var messageWarm = "let's go for walk"
    var messageCool = "let's go out"
    var messageCold = "pretty cold out there"
    var messageFreezing = "let's stay indoors"
    var messageExtremeCold = "don't fucking out, you will freeze out there"
}



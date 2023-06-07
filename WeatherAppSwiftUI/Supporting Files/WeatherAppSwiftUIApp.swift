//
//  WeatherAppSwiftUIApp.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 03/06/23.
//

import SwiftUI

@main
struct WeatherAppSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherView()
                .environmentObject(WeatherViewModel())
                .environmentObject(ConfigurationViewModel())
                .environment(\.colorScheme, .dark)
        }
    }
}

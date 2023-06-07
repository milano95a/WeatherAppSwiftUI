//
//  ColorStorage.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 07/06/23.
//

import SwiftUI

struct ColorStorage {
    static let colors: [WeatherType: Color] = [
        .extremeHot: Color(red: 122/255, green: 32/255, blue: 13/255),
        .tooHot: Color(red: 204/255, green: 76/255, blue: 48/255),
        .hot: Color(red: 211/255, green: 99/255, blue: 75/255),
        .warm: Color(red: 166/255, green: 229/255, blue: 137/255),
        .cool: Color(red: 112/255, green: 202/255, blue: 231/255),
        .cold: Color(red: 60/255, green: 181/255, blue: 220/255),
        .freezing: Color(red: 15/255, green: 125/255, blue: 159/255),
        .extremeCold: Color(red: 47/255, green: 62/255, blue: 67/255),
    ]
}

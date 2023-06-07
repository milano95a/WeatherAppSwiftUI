//
//  ImageStorage.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 07/06/23.
//

import Foundation

struct ImageStorage {
    static let images: [WeatherType: String] = [
        .extremeHot: "house",
        .tooHot: "t-shirt",
        .hot: "t-shirt",
        .warm: "t-shirt",
        .cool: "shirt",
        .cold: "long sleeve",
        .freezing: "hoodie",
        .extremeCold: "coat",
    ]
}

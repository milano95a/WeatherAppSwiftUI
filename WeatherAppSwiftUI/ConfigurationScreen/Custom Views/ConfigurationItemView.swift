//
//  ConfigurationItemView.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 07/06/23.
//

import SwiftUI

struct ConfigurationItemView: View {
    var title: String
    @Binding var temperature: Int
    @Binding var message: String
    var backgroundColor: Color
    @Binding var max: Int
    @Binding var min: Int
    
    var body: some View {
        VStack(spacing: 0) {
            WeatherStepper(title: title, temperature: $temperature, max: $max, min: $min)
                .frame(height: 70)
                .background(backgroundColor)
            
            CustomTextField("message", $message, Color.gray1)
                .frame(height: 70)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .background(backgroundColor)
        }
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
    }
}








































struct ConfigurationItemView_Previews: PreviewProvider {
    
    @State static var temperature = 25
    @State static var message = "message"
    @State static var max = 40
    @State static var min = 25
    
    static var previews: some View {
        ConfigurationItemView(
            title: "title",
            temperature: $temperature,
            message: $message,
            backgroundColor: .black1,
            max: $max,
            min: $min
        )
    }
}

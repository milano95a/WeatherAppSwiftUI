//
//  WeatherStepper.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 04/06/23.
//

import SwiftUI

struct WeatherStepper: View {
    var title: String
    @Binding var temperature: Int
    @Binding var max: Int
    @Binding var min: Int
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
            Spacer()
            Button(action: {
                temperature += 1
            }, label: {
                Image(systemName: "plus")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
            })
            .buttonStyle(.borderless)
            .disabled(temperature == max)
            Text("above \(temperature)°")
                .fontWeight(.bold)
                .font(.system(size: 20))

            Button(action: {
                temperature -= 1
            }, label: {
                Image(systemName: "minus")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
            })
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
            .buttonStyle(.borderless)
            .disabled(temperature == min)
        }

    }
}






























struct WeatherStepper_Previews: PreviewProvider {
    static var title = "title"
    @State static var temperature = 25
    @State static var max = 40
    @State static var min = 25
    
    static var previews: some View {
        WeatherStepper(title: title, temperature: $temperature, max: $max, min: $min)
    }
}

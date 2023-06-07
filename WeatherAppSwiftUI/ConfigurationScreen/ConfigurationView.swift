//
//  ConfigurationView.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 04/06/23.
//

import SwiftUI

struct ConfigurationView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var vm: ConfigurationViewModel

    var body: some View {
        List {
            ConfigurationItemView(
                title: "Extreme Hot",
                temperature: $vm.configuration.temperatureExtremeHot,
                message: $vm.configuration.messageExtremeHot,
                backgroundColor: Color.red3,
                max: Binding.constant(Int.max),
                min: $vm.configuration.temperatureTooHot)

            ConfigurationItemView(
                title: "Too Hot",
                temperature: $vm.configuration.temperatureTooHot,
                message: $vm.configuration.messageTooHot,
                backgroundColor: Color.red2,
                max: $vm.configuration.temperatureExtremeHot,
                min: $vm.configuration.temperatureHot)

            ConfigurationItemView(
                title: "Hot",
                temperature: $vm.configuration.temperatureHot,
                message: $vm.configuration.messageHot,
                backgroundColor: Color.red1,
                max: $vm.configuration.temperatureTooHot,
                min: $vm.configuration.temperatureWarm)

            ConfigurationItemView(
                title: "Warm",
                temperature: $vm.configuration.temperatureWarm,
                message: $vm.configuration.messageWarm,
                backgroundColor: Color.green1,
                max: $vm.configuration.temperatureHot,
                min: $vm.configuration.temperatureCool)

            ConfigurationItemView(
                title: "Cool",
                temperature: $vm.configuration.temperatureCool,
                message: $vm.configuration.messageCool,
                backgroundColor: Color.blue1,
                max: $vm.configuration.temperatureWarm,
                min: $vm.configuration.temperatureCold)

            ConfigurationItemView(
                title: "Cold",
                temperature: $vm.configuration.temperatureCold,
                message: $vm.configuration.messageCold,
                backgroundColor: Color.blue2,
                max: $vm.configuration.temperatureCool,
                min: $vm.configuration.temperatureFreezing)

            ConfigurationItemView(
                title: "Freezing",
                temperature: $vm.configuration.temperatureFreezing,
                message: $vm.configuration.messageFreezing,
                backgroundColor: Color.blue3,
                max: $vm.configuration.temperatureCold,
                min: $vm.configuration.temperatureExtremeCold)

            ConfigurationItemView(
                title: "Extreme Cold",
                temperature: $vm.configuration.temperatureExtremeCold,
                message: $vm.configuration.messageExtremeCold,
                backgroundColor: Color.black1,
                max: $vm.configuration.temperatureFreezing,
                min: Binding.constant(Int.min))
        }
        .foregroundColor(.white)
        .listStyle(.plain)
        .navigationBarBackButtonHidden(true)
        .background(LinearGradient(colors: [.red3, .black1], startPoint: .top, endPoint: .bottom))
        .navigationTitle("Configuration")
        .scrollIndicators(.hidden)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AboutScreen(), label: {
                    Text("About")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                })
            }
        }
    }
}

































struct ConfigurationView_Previews: PreviewProvider {
    static let configuration = WeatherConfiguration()
    
    static var previews: some View {
        ConfigurationView()
            .environmentObject(ConfigurationViewModel())
    }
}

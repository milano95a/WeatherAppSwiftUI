//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 03/06/23.
//

import SwiftUI

struct WeatherView: View {
    @EnvironmentObject var vm: WeatherViewModel
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ContainerWithProgressView($vm.isLoading) {
                    VStack(spacing: 0) {
                        if Reachability.isConnectedToNetwork() {
                            configButton(geometry)
                            weatherContent(geometry)
                        } else {
                            noInternet(geometry)
                        }
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(vm.weatherColor ?? .green1)
                .onAppear {
                    Task {
                        await vm.refresh()
                    }
                }
            }
        }
    }
    
    func configButton(_ geometry: GeometryProxy) -> some View {
        HStack {
            Spacer()
            NavigationLink(destination: ConfigurationView(), label: {
                Image(systemName: "gear")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
            })
        }
        .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
    }
    
    func weatherContent(_ geometry: GeometryProxy) -> some View {
        VStack {
            Text(vm.description ?? "")
                .font(.system(size: 50))
                .fontWeight(.bold)
            Text(vm.message ?? "")
                .font(.system(size: 20))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 64, trailing: 0))
            Text(vm.temperature ?? "")
                .font(.system(size: 36))
                .fontWeight(.bold)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: -1, trailing: 0))
            Image(vm.weatherClothing ?? "")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .frame(width: geometry.size.width, height: geometry.size.height * 0.9)
        .foregroundColor(.white)
    }
    
    func noInternet(_ geometry: GeometryProxy) -> some View {
        VStack {
            Image(systemName: "wifi.slash")
                .foregroundColor(.white)
                .font(.system(size: 100))
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
    }
}
















































struct ContentView_Previews: PreviewProvider {
    static let configuration = WeatherConfiguration()
    static var previews: some View {
        WeatherView()
            .environmentObject(WeatherViewModel())
    }
}

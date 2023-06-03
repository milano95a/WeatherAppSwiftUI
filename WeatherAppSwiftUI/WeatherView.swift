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
        GeometryReader { geometry in
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                    })
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
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
            .background(vm.weatherColor ?? .clear)
            .onAppear {
                Task {
                    await vm.refresh()
                }
            }
        }
    }
}
















































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .environmentObject(WeatherViewModel())
    }
}

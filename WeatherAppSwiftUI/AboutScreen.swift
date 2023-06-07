//
//  SwiftUIView.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 08/06/23.
//

import SwiftUI

struct AboutScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("W°")
                    .font(.system(size: 200))
                    .foregroundColor(.green2)
                    .fontWeight(.bold)
                Spacer()
                Text("Developed by Abudrakhmon Jamoliddinov")
                    .font(.system(size: 12))
                    .foregroundColor(.green2)
                    .fontWeight(.bold)
                Text("Icons by https://icons8.com")
                    .font(.system(size: 12))
                    .foregroundColor(.green2)
                    .fontWeight(.bold)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .background(Color.green1)
        .foregroundColor(.white)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("About")
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
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}

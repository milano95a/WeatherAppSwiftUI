//
//  MyTextField.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 04/06/23.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholderText: String
    let placeholderTextColor: Color
    
    init(_ placeholderText: String, _ text: Binding<String>, _ placeholderColor: Color = .gray) {
        self._text = text
        self.placeholderText = placeholderText
        self.placeholderTextColor = placeholderColor
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholderText)
                    .foregroundColor(placeholderTextColor)
            }
            TextField("", text: $text)
        }
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
    }
}

struct MyTextField_Previews: PreviewProvider {
    static var placeholder = "placeholder"
    @State static var text = ""
    static var placeholderTextColor = Color.red
    
    static var previews: some View {
        CustomTextField(placeholder, $text, placeholderTextColor)
    }
}

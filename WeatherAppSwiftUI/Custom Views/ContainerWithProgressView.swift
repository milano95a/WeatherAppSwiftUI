//
//  ContainerWithProgressView.swift
//  WeatherAppSwiftUI
//
//  Created by Workspace (Abdurakhmon Jamoliddinov) on 08/06/23.
//

import SwiftUI

struct ContainerWithProgressView<Content: View>: View {
    
    @Binding var isLoading: Bool
    @ViewBuilder let content: Content
    
    init(_ isLoading: Binding<Bool>, @ViewBuilder _ content: () -> Content) {
        self._isLoading = isLoading
        self.content = content()
    }
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .scaleEffect(2)
            } else {
                content
            }
        }
        .background(.clear)
    }
}






































//struct ContainerWithProgressView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContainerWithProgressView()
//    }
//}

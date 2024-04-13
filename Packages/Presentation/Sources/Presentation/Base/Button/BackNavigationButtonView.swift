//
//  BackNavigationButtonView.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import SwiftUI

struct BackNavigationButtonView: View {
    
    var action: () -> Void
    @State var image: String
    @State var color: Color
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Image(image, bundle: .module)
                    .foregroundColor(color)
            }
        }
    }
}

#Preview {
    BackNavigationButtonView(action: {}, image: "blackArrowLeft", color: Color(named: .gray))
}

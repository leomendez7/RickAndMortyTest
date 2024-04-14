//
//  InformationDetailView.swift
//
//
//  Created by Leonardo Mendez on 14/04/24.
//

import SwiftUI

struct InformationDetailView: View {
    
    @State var information: String
    
    var body: some View {
        VStack (spacing: 8) {
            HStack {
                Text(information)
                    .typography(custom: FontManager.book, size: 20)
                    .foregroundColor(fromAssets: .black2)
                Spacer()
            }
            Divider().background(Color(named: .black2)).frame(height: 1)
        }
        
    }
}

#Preview {
    InformationDetailView(information: "Alive")
}

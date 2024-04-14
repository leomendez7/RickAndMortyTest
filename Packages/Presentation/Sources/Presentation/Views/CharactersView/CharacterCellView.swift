//
//  CHaracterCellView.swift
//
//
//  Created by Leonardo Mendez on 14/04/24.
//

import SwiftUI
import Kingfisher

struct CharacterCellView: View {
    
    @State var name: String
    @State var species: String
    @State var imageUrl: String
    
    var body: some View {
        HStack {
            KFImage.url(URL(string: imageUrl)).placeholder { progress in
                if imageUrl.isEmpty {
                    Rectangle()
                        .fill(Color(named: .black2))
                        .frame(width: 50, height: 50)
                } else {
                    ProgressView()
                }
            }
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .typography(custom: FontManager.book, size: 20)
                        .foregroundColor(fromAssets: .black2)
                    Text(species)
                        .typography(custom: FontManager.book, size: 13)
                        .foregroundColor(fromAssets: .black2)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 25)
        .frame(height: 91)
        .frame(maxWidth: .infinity)
        .background(Color(named: .lightGray))
        .cornerRadius(20)
    }
    
}

#Preview {
    CharacterCellView(name: "Rick Sanchez", species: "Human", imageUrl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
}

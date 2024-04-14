//
//  CharacterDetailsView.swift
//  
//
//  Created by Leonardo Mendez on 14/04/24.
//

import SwiftUI
import Domain
import Kingfisher

struct CharacterDetailsView: View {
    
    @EnvironmentObject var store: Store
    @State var character: Character
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                KFImage.url(URL(string: character.image)).placeholder {
                    Rectangle()
                        .fill(Color(named: .black))
                        .frame(width: 200, height: 200)
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                VStack(spacing: 8) {
                    InformationDetailView(information: "Status: \(character.status)")
                    InformationDetailView(information: "Species: \(character.species)")
                    InformationDetailView(information: "Gender: \(character.gender)")
                    InformationDetailView(information: "Origin: \(character.origin.name)")
                    InformationDetailView(information: "Location: \(character.location.name)")
                    InformationDetailView(information: "Number of episodes: \(character.episode.count)")
                }
                .padding(.leading, 25)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(Color(named: .lightGray))
                .cornerRadius(20)
            }
            .padding(.horizontal, 18)
            .padding(.top, 18)
        }
        .navigationTitle(character.name)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackNavigationButtonView(action: {
            store.details.removeLast()
        }, image: Assets.Icons.blackArrowLeft.rawValue, color: Color(named: .black)))
    }
}

#Preview {
    CharacterDetailsView(character: Character())
        .environmentObject(Store())
}

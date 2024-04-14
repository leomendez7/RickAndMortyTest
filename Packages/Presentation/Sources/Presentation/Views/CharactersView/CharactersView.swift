//
//  CharactersView.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import SwiftUI
import Domain

public struct CharactersView: View {
    
    @EnvironmentObject var store: Store
    @StateObject var viewModel: CharactersViewModel
    @State private var selectedCharacter: Character? = nil
    
    public init(viewModel: CharactersViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationStack(path: $store.details) {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.characters.indices, id: \.self) { index in
                        CHaracterCellView(name: viewModel.characters[index].name, species: viewModel.characters[index].species.rawValue, imageUrl: viewModel.characters[index].image)
                            .padding(.horizontal, 16)
                            .onTapGesture {
                                selectedCharacter = viewModel.characters[index]
                                store.details.append("details")
                            }
                    }
                }
                .padding(.top, 20)
                .navigationDestination(for: String.self,
                                       destination: {
                    route in
                    switch route {
                    case "details":
                        CharacterDetailsView(character: self.selectedCharacter ?? Character())
                    default:
                        EmptyView()
                    }
                })
            }
            .navigationTitle("List of Characters")
            .navigationBarItems(trailing:
                                    Button(action: {
                Task {
                    await viewModel.fetchCharacters()
                }
            }) {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(Color(named: .black))
                    .imageScale(.large)
            }
            )
            .onAppear {
                Task {
                    await viewModel.fetchCharacters()
                }
            }
            .alert(isPresented: $viewModel.isRequestError) {
                Alert(
                    title: Text("Error!"),
                    message: Text("An error has occurred please try again."),
                    primaryButton: .default(Text("Retry"), action: {
                        Task {
                            await viewModel.fetchCharacters()
                        }
                    }), secondaryButton: .cancel()
                )
            }
        }
    }
}

#Preview {
    CharactersView(viewModel: Constants.charactersViewModel)
        .environmentObject(Store())
}

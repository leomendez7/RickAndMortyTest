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
    
    @State private var currentPage = 1
    @State private var isLoading = false
    
    public init(viewModel: CharactersViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationStack(path: $store.details) {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.characters.indices, id: \.self) { index in
                        CharacterCellView(name: viewModel.characters[index].name, species: viewModel.characters[index].species, imageUrl: viewModel.characters[index].image)
                            .padding(.horizontal, 16)
                            .onAppear {
                                // Check if the last cell is appearing
                                if index == viewModel.characters.count - 1 && !isLoading {
                                    loadMoreData()
                                }
                            }
                            .onTapGesture {
                                selectedCharacter = viewModel.characters[index]
                                store.details.append("details")
                            }
                    }
                }
                .padding(.top, 20)
                .onReceive(viewModel.$characters) { _ in
                    isLoading = false // Reset isLoading flag when new data is received
                }
                .navigationTitle("List of Characters")
                .navigationBarItems(trailing:
                                        Button(action: {
                    Task {
                        await viewModel.fetchCharacters(page: "\(currentPage)")
                    }
                }) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(Color(named: .black))
                        .imageScale(.large)
                })
                .navigationDestination(for: String.self, destination: { route in
                    switch route {
                    case "details":
                        CharacterDetailsView(character: self.selectedCharacter ?? Character())
                    default:
                        EmptyView()
                    }
                })
            }
            .onAppear {
                if viewModel.characters.count == 0 {
                    Task {
                        await viewModel.fetchCharacters(page: "1")
                    }
                }
            }
            .alert(isPresented: $viewModel.isRequestError) {
                Alert(
                    title: Text("Error!"),
                    message: Text("An error has occurred please try again."),
                    primaryButton: .default(Text("Retry"), action: {
                        Task {
                            await viewModel.fetchCharacters(page: "\(currentPage)")
                        }
                    }), secondaryButton: .cancel()
                )
            }
        }
    }
    
    private func loadMoreData() {
        isLoading = true
        currentPage += 1
        Task {
            await viewModel.fetchCharacters(page: "\(currentPage)")
        }
    }
    
}

#Preview {
    CharactersView(viewModel: Constants.charactersViewModel)
        .environmentObject(Store())
}

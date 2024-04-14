//
//  CharactersViewModel.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation
import Domain

public class CharactersViewModel: BaseViewModel<FetchCharactersUseCase>, ObservableObject {
    
    var store: Store
    @Published var characters: [Character] = []
    @Published var isRequestError: Bool = false
    
    public init(useCase: FetchCharactersUseCase, store: Store) {
        self.store = store
        super.init(useCase: useCase)
    }
    
    func fetchCharacters(page: String) async {
        do {
//            guard let characters = Default.characterResponse else {
//                let defaults = UserDefaults.standard
//                defaults.removeObject(forKey: Default.Key.character.rawValue)
                let response = try await useCase.execute(requestValue: page)
                DispatchQueue.main.async {
                    response.forEach { character in
                        self.characters.append(character)
                    }
                }
//                return
//            }
//            DispatchQueue.main.async {
//                characters.characters.forEach { character in
//                    self.characters.append(character)
//                }
//            }
        } catch {
            DispatchQueue.main.async {
                self.isRequestError.toggle()
            }
            print(error.localizedDescription)
        }
    }
    
}

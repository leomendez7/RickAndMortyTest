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
    @Published var cards: [Character] = []
    @Published var isrequestError: Bool = false
    
    public init(useCase: FetchCharactersUseCase, store: Store) {
        self.store = store
        super.init(useCase: useCase)
    }
    
}

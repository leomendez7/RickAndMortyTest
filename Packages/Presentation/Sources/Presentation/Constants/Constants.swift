//
//  Constants.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation
import Domain
import Data

public class Constants {
    
    public static var charactersViewModel =  generateCharactersViewModule()

    private static func generateCharactersViewModule() -> CharactersViewModel {
        let repository = FetchCharactersRepository(dataSource: FetchCharactersDataSource(urlBase: createURLBase()))
        let useCase = FetchCharactersUseCase(repository: repository)
        let charactersViewModel = CharactersViewModel(useCase: useCase, store: Store.storeDefault)
        return charactersViewModel
    }
    
    fileprivate static func createURLBase() -> String {
        let host = "rickandmortyapi.com"
        return host
    }
    
}

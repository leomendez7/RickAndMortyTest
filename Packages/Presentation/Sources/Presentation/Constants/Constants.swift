//
//  Constants.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation
import Domain
import Data
import Alamofire

public class Constants {
    
    public static var charactersViewModel =  generateCharactersViewModule()

    private static func generateCharactersViewModule() -> CharactersViewModel {
        let repository = FetchCharactersRepository(dataSource: FetchCharactersDataSource(apiClient: createClient()))
        let useCase = FetchCharactersUseCase(repository: repository)
        let charactersViewModel = CharactersViewModel(useCase: useCase, store: Store.storeDefault)
        return charactersViewModel
    }
    
    fileprivate static func createClient() -> APIClient {
        let host = "https://rickandmortyapi.com/api/"
        let server = DefaultAPIServer(host: host)
        return APIClient(server: server, session: Session())
    }
    
}

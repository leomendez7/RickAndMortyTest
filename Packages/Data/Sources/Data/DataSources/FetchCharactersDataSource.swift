//
//  FetchCharactersDataSource.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation
import Domain
import Alamofire
import Shared

public class FetchCharactersDataSource: FetchCharactersRepositoryProtocol {
    
    let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func fetchCharacters(page: String) async throws -> [Character] {
        let path = "character"
        let response: DataResponse<CharacterResponse, AFError> = await apiClient.get(path)
        let result = response.result
        switch result {
        case .success(let response):
            AppLogger.debug(response.convertToJSON())
            return response.characters
        case .failure(let error):
            AppLogger.error(error.localizedDescription, context: error)
            throw error
        }
    }
    
}

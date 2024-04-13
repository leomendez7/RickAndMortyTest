//
//  FetchCardsListRepository.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation
import Domain

public class FetchCardsListRepository: FetchCharactersRepositoryProtocol {
    
    let dataSource: FetchCharactersDataSource
    
    public init(dataSource: FetchCharactersDataSource) {
        self.dataSource = dataSource
    }
    
    public func fetchCharacters(page: String) async throws -> [Character] {
        return try await dataSource.fetchCharacters(page: page)
    }
    
}

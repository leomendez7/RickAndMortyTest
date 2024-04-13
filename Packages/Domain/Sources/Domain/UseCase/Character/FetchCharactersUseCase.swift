//
//  FetchCharactersUseCase.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation

public class FetchCharactersUseCase: UseCaseProtocol {
    
    let repository: FetchCharactersRepositoryProtocol
    
    public init(repository: FetchCharactersRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(requestValue: String) async throws -> [Character] {
        return try await repository.fetchCharacters(page: requestValue)
    }
    
}

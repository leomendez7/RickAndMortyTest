//
//  FetchCharactersRepositoryProtocol.swift
//  
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation

public protocol FetchCharactersRepositoryProtocol {
    
    func fetchCharacters(page: String) async throws -> [Character]
    
}

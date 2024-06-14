//
//  FetchCharactersDataSource.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation
import Domain
import Shared

public class FetchCharactersDataSource: FetchCharactersRepositoryProtocol {

    var urlBase: String
    
    public init(urlBase: String) {
        self.urlBase = urlBase
    }
    
    public func fetchCharacters(page: String) async throws -> [Character] {
        guard let url = Networking.shared.createURL(path: "character/", urlBase: urlBase, page: page) else {
            print("Error: Invalid URL")
            throw URLError(.badURL)
        }
        print("URL: \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error: Bad server response")
                throw URLError(.badServerResponse)
            }
            print("Response: \(httpResponse.statusCode)")
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let characterResponse = try decoder.decode(CharacterResponse.self, from: data)
                print("CharacterResponse: \(characterResponse)")
                Default.save(characterResponse: characterResponse)
                return characterResponse.characters
            } catch {
                print("Error: Decoding error - \(error.localizedDescription)")
                throw error
            }
        } catch {
            print("Error: Fetch error - \(error.localizedDescription)")
            throw error
        }
    }
    
}

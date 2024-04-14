//
//  File.swift
//  
//
//  Created by Leonardo Mendez on 14/04/24.
//

import Foundation

extension Default {
    
    public static var characterResponse: CharacterResponse? { return CharacterResponse.current }
    
    public static func save(characterResponse: CharacterResponse) {
        guard let encoded = try? JSONEncoder().encode(characterResponse) else { return }
        UserDefaults.standard.set(encoded, forKey: Default.Key.character.rawValue)
    }
    
}

@available(iOS 13.0, *)
public extension CharacterResponse {
    
    static var current: CharacterResponse? {
        let defaults = UserDefaults.standard
        if let savedCharacterResponse = defaults.object(forKey: Default.Key.character.rawValue) as? Data {
            let decoder = JSONDecoder()
            return try? decoder.decode(CharacterResponse.self, from: savedCharacterResponse)
        }
        return nil
    }
    
}

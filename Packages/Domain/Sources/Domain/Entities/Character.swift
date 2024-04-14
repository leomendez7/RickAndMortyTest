//
//  File.swift
//  
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation

// MARK: - Character
public struct CharacterResponse: Codable {
    public let info: Info
    public let characters: [Character]
    
    enum CodingKeys: String, CodingKey {
        case info
        case characters = "results"
    }
}

// MARK: - Info
public struct Info: Codable {
    public let count: Int
    public let pages: Int
    public let next: String
    public let prev: String?
}

// MARK: - Result
public struct Character: Codable {
    public let id: Int
    public let name: String
    public let status: String
    public let species: String
    public let type: String
    public let gender: String
    public let origin: Location
    public let location: Location
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String
    
    public init() {
        self.id = 0
        self.name = ""
        self.status = ""
        self.species = ""
        self.type = ""
        self.gender = ""
        self.origin = Location()
        self.location = Location()
        self.image = ""
        self.episode = []
        self.url = ""
        self.created = ""
    }
    
}

public enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
public struct Location: Codable {
    public let name: String
    public let url: String
    
    public init() {
        name = ""
        url = ""
    }
}

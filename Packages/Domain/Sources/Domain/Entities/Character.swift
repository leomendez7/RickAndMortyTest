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
    public let prev: JSONNull?
}

// MARK: - Result
public struct Character: Codable {
    public let id: Int
    public let name: String
    public let status: Status
    public let species: Species
    public let type: String
    public let gender: Gender
    public let origin, location: Location
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String
}

public enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
public struct Location: Codable {
    let name: String
    let url: String
}

public enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

public enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
        // Aquí proporcionas la lógica para generar el hash
        // En este caso, simplemente combinamos un valor constante
        hasher.combine(0)
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
    
}

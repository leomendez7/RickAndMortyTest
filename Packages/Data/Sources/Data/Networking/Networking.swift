//
//  Networking.swift
//
//
//  Created by Leonardo Mendez on 14/06/24.
//

import Foundation

public class Networking {
    
    static let shared = Networking()
    
    public func createURL(path: String, urlBase: String, page: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = urlBase
        urlComponents.path = "/api/\(path)"
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: page)
        ]
        guard let url = urlComponents.url else {
            print("Error: Invalid URL")
            return nil
        }
        return url
    }
    
}

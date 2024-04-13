//
//  APICachePolicy.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation

enum APICachePolicy {
    case networkOnly
    case cacheOnly
    //case cacheElseNetwork
    case networkElseCache
    case cacheThenNetwork
    
    func isCache() -> Bool {
        if self == .networkOnly || self == .networkElseCache { return false }
        return true
    }
}

//
//  APIError.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation

public enum ResponseError: Error, LocalizedError {
    
    case `default`
    case iCloud
    case login
    case internetConnection
    case serializer
    case noDatesAvailable
    case custom(message: String)
    case unauthorized
    
    public var errorDescription: String? {
        return localizedDescription
    }
    
    var localizedDescription: String {
        switch self {
        case .custom(let message):
            return message
        case .internetConnection:
            return "No Internet Connection. Make sure you're connected or try again later."
        case .iCloud:
            return "Please connect to iCloud on your settings."
        case .login:
            return "Incorrect Email or Password. Please try again."
        case .serializer:
            return "Something went wrong fetching the response, please try again."
        default:
            return "Something went wrong, please try again later."
        }
    }
    
    static func == (_ lhs: ResponseError, rhs: ResponseError) -> Bool {
        return lhs.errorDescription == rhs.errorDescription
    }
    
    static func != (_ lhs: ResponseError, rhs: ResponseError) -> Bool {
        return lhs.errorDescription != rhs.errorDescription
    }
}

extension NSNotification.Name {
    public static var unauthorized: Notification.Name { .init(rawValue: "Unauthorized") }
}

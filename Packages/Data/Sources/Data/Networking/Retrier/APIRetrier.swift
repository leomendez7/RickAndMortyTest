//
//  APIRetrier.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation
import Alamofire
import Domain
import Shared

public struct APIRetrier: RequestRetrier {
    
    private let lock = NSLock()
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {

    }
    
}

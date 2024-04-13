//
//  APIAdapter.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation
import Alamofire
import Domain

public struct APIAdapter: RequestAdapter {

    public static let shared = APIAdapter()
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        let urlRequest = urlRequest
        completion(.success(urlRequest))
    }
    
}

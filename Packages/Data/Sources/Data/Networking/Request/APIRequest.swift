//
//  APIRequest.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import UIKit
import Alamofire

struct APIRequest {
    
    var httpMethod: HTTPMethod
    var path: String?
    var parameters: Parameters?
    var headers: HTTPHeaders?
    var parameterEncoding: Alamofire.ParameterEncoding = JSONEncoding.default
    var cachePolicy: String = ""
    
    init(httpMethod: HTTPMethod,
         path: String? = nil,
         parameters: Parameters? = nil,
         headers: HTTPHeaders? = nil,
         parameterEncoding: Alamofire.ParameterEncoding = JSONEncoding.default) {
        self.httpMethod = httpMethod
        self.path = path
        self.headers = headers
        self.parameters = parameters
        self.parameterEncoding = parameterEncoding
        //self.setupDefaultEncoding()
    }

    private mutating func setupDefaultEncoding() {
        switch self.httpMethod {
        case .post, .put, .patch:
            self.parameterEncoding = JSONEncoding.default
        default:
            self.parameterEncoding = URLEncoding.default
        }
    }
}


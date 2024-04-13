//
//  APIRouter.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation
import Alamofire
import Shared

struct APIRequestConvertible: URLRequestConvertible {
    
    let server: APIServer
    let request: APIRequest
    
    init(server: APIServer, request: APIRequest) {
        self.server = server
        self.request = request
    }
    
    func asURLRequest() throws -> URLRequest {
        var url = try server.host.asURL()
        let paths = [server.path, request.path]
        paths.compactMap { $0 }.forEach { url = url.appendingPathComponent($0) }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod.rawValue
        urlRequest.addHTTPHeaders(server.headers)
        urlRequest.addHTTPHeaders(request.headers)
        let encoding = request.parameterEncoding
        let encodedRequest = try encoding.encode(urlRequest, with: request.parameters)
        let message = "\(request.httpMethod.rawValue) \(encodedRequest)"
        Logs.log(message: message)
        return encodedRequest
    }
}

extension URLRequest {
    mutating func addHTTPHeaders(_ headers: HTTPHeaders?) {
        guard let headers = headers?.dictionary else { return }
        for (key, value) in headers {
            setValue(value, forHTTPHeaderField: key)
        }
    }
}

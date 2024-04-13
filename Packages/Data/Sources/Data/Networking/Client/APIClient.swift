//
//  APIClient.swift
//  
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation
import Alamofire

/// Syntax Sugar for most common HTTP methods

public actor APIClient {
    
    private var server: APIServer
    private let session: Session
    
    public var host: String {
        return server.host
    }
    
    // TODO: Replace this with DI library
    public init(server: APIServer, session: Session) {
        self.server = server
        self.session = session
    }
    
    /// Sends a GET HTTP request
    func get<T: Decodable>(
        _ path: String,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? = nil
    ) async -> DataResponse<T, AFError> {
        let request = APIRequest(httpMethod: .get, path: path, parameters: parameters, headers: headers)
        return await self.request(request)
    }
    
    /// Sends a POST HTTP request
    func post<T: Decodable>(_ path: String,
                            parameters: Parameters? = nil,
                            headers: HTTPHeaders? = nil) async -> DataResponse<T, AFError> {
        let request = APIRequest(httpMethod: .post, path: path, parameters: parameters, headers: headers)
        return await self.request(request)
    }
    
    /// Sends a PUT HTTP request
    func put<T: Decodable>(_ path: String,
                           parameters: Parameters? = nil,
                           headers: HTTPHeaders? = nil) async -> DataResponse<T, AFError> {
        let request = APIRequest(httpMethod: .put, path: path, parameters: parameters, headers: headers)
        return await self.request(request)
    }
    
    /// Sends a PATCH HTTP request
    func patch<T: Decodable>(_ path: String, parameters: Parameters? = nil,
                             headers: HTTPHeaders? = nil) async -> DataResponse<T, AFError> {
        let request = APIRequest(httpMethod: .patch, path: path, parameters: parameters, headers: headers)
        return await self.request(request)
    }
    
    /// Sends a DELETE HTTP request
    func delete<T: Decodable>(_ path: String,
                              parameters: Parameters? = nil,
                              headers: HTTPHeaders? = nil) async -> DataResponse<T, AFError> {
        let request = APIRequest(httpMethod: .delete, path: path, parameters: parameters, headers: headers)
        return await self.request(request)
    }
    
    /// Sends a HTTP request with a given HTTP method
    
    func request<T: Decodable>(_ request: APIRequest) async -> DataResponse<T, AFError> {
        let requestConvertible = APIRequestConvertible(server: server, request: request)
        let task = session.request(requestConvertible).validate().serializingDecodable(T.self)
        return await task.response
    }
    
}

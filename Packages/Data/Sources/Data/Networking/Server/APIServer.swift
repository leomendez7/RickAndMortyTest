//
//  APIServer.swift
//
//
//  Created by Leonardo Mendez on 13/04/24.
//

import Foundation
import Alamofire

public protocol APIServer {
    var host: String { get }
    var headers: HTTPHeaders? { get }
    var path: String { get }
}

public class DefaultAPIServer: APIServer {
    
    public var host: String = ""
    public var headers: HTTPHeaders?
    public var path: String = ""
    
    public init() { }
    
    public init(host: String) {
        self.host = host
    }
}

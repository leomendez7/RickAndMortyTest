import XCTest
@testable import Data

final class DataTests: XCTestCase {
    
    var dataSource: FetchCharactersDataSource!
    
    override func setUp() {
        super.setUp()
        dataSource = FetchCharactersDataSource(urlBase: "example.com")
        URLProtocol.registerClass(URLProtocolMock.self)
    }
    
    override func tearDown() {
        dataSource = nil
        URLProtocol.unregisterClass(URLProtocolMock.self)
        super.tearDown()
    }
    
    func testCreateURL() {
        let url = Networking.shared.createURL(path: "character/", urlBase: "example.com", page: "1")
        XCTAssertEqual(url?.absoluteString, "https://example.com/api/character/?page=1")
    }
    
}

class URLProtocolMock: URLProtocol {
    
    static var testURLs = [URL?: (Data?, URLResponse?)]()
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let url = request.url, let (data, response) = URLProtocolMock.testURLs[url] {
            if let data = data {
                client?.urlProtocol(self, didLoad: data)
            }
            if let response = response {
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
            client?.urlProtocolDidFinishLoading(self)
        } else {
            client?.urlProtocol(self, didFailWithError: URLError(.badServerResponse))
        }
    }
    
    override func stopLoading() {}
}

//
//  NetworkService.swift
//  Avocado
//
//  Created by Naresh Muthuluri on 07/04/25.
//

import Foundation
import Combine

enum APIError: Error {
    case inavalidRequest
    case invalidResponse
    case decodingError
    case networkError(Error)
}

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

struct Endpoint {
    let path: String
    let method: HTTPMethod
    let parameters: [String: Any]?
    
    func asURLRequest() -> URLRequest? {
        guard let url = URL(string: path) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let parameters = parameters {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }
        return request
    }
}


protocol NetworkServiceProtocol {
    func apiRequest<T: Decodable>(_ endpoint: Endpoint) -> AnyPublisher<T, Error>
}


class NetworkService: NetworkServiceProtocol {
    
    private var urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func apiRequest<T>(_ endpoint: Endpoint) -> AnyPublisher<T, any Error> where T : Decodable {
        guard let urlRequest = endpoint.asURLRequest() else {
            return Fail(error: APIError.inavalidRequest).eraseToAnyPublisher()
        }
        
        return urlSession.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw APIError.invalidResponse
                }
                
                let decoder = JSONDecoder()
                do {
                    return try decoder.decode(T.self, from: data)
                } catch {
                    throw APIError.decodingError
                }
            }
            .mapError { error in
                if let apiError = error as? APIError {
                    return apiError
                } else {
                    return APIError.networkError(error)
                }
            }
            .eraseToAnyPublisher()
    }
}


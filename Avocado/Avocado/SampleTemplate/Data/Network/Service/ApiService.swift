//
//  ApiService.swift
//  ApiCalllCleanArchitect
//
//  Created by Suraj Kumar Gupta on 07/04/25.
//

import Foundation
import Combine

protocol ApiServiceProtocol {
    func request<T: Decodable> (_endpoint: APIEndPoint) -> AnyPublisher<T, Error>
}

final class APIService: ApiServiceProtocol {
    func request<T: Decodable>(_endpoint: APIEndPoint) -> AnyPublisher <T, Error> {
        guard let urlRequest = _endpoint.urlRequest else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on:  DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

//
//  APIEndPoint.swift
//  ApiCalllCleanArchitect
//
//  Created by Suraj Kumar Gupta on 07/04/25.
//

import Foundation

protocol APIEndPoint {
    var path: String { get }
    var method: String { get }
    var queryItems: [URLQueryItem]? { get }
    var headers:[String : String]? { get }
    var body: Data? { get }
    var urlRequest: URLRequest? { get }
}

extension APIEndPoint {
    var baseURL: String {
        "https://run.mocky.io/v3/"
    }
    var urlRequest: URLRequest? {
        guard var components = URLComponents(string: baseURL + path) else {
            return nil
        }
        components.queryItems = queryItems
        guard let url = components.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        headers?.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }
        return request
    }
}

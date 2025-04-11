//
//  FactEndPoint.swift
//  Avocados
//
//  Created by Suraj Kumar Gupta on 07/04/25.
//

import Foundation

struct FactsEndPoint: APIEndPoint {
    var path: String {"b63b0070-962e-425c-a822-83fd5e91b0b7"}
    var method: String {"GET"}
    var queryItems: [URLQueryItem]? = nil
    var headers: [String : String]? = nil
    var body: Data? = nil
}

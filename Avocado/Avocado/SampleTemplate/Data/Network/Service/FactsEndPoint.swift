//
//  FactEndPoint.swift
//  Avocados
//
//  Created by Suraj Kumar Gupta on 07/04/25.
//

import Foundation

struct FactsEndPoint: APIEndPoint {
    var path: String {"b051d24e-98a7-4bdb-9e13-bdc5bed6cdd1"}
    var method: String {"GET"}
    var queryItems: [URLQueryItem]? = nil
    var headers: [String : String]? = nil
    var body: Data? = nil
}

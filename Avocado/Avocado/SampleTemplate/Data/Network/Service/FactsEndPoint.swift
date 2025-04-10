//
//  FactEndPoint.swift
//  Avocados
//
//  Created by Suraj Kumar Gupta on 07/04/25.
//

import Foundation

struct FactsEndPoint: APIEndPoint {
    var path: String {"534195fc-6280-4a57-bfa9-88807a1e39c0"}
    var method: String {"GET"}
    var queryItems: [URLQueryItem]? = nil
    var headers: [String : String]? = nil
    var body: Data? = nil
}

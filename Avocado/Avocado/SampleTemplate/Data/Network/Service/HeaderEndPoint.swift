//
//  HeaderEndPoint.swift
//  Created by Suraj Kumar Gupta on 07/04/25.
//

import Foundation

struct HeaderEndPoint: APIEndPoint {
    var path: String {"577852fd-f59e-4ff5-aab8-21770a48b058"}
    var method: String {"GET"}
    var queryItems: [URLQueryItem]? = nil
    var headers: [String : String]? = nil
    var body: Data? = nil
}

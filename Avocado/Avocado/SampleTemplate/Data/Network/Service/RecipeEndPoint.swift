//
//  RecipeEndPoint.swift
//  Avocados
//
//  Created by Suraj Kumar Gupta on 07/04/25.
//

import Foundation

struct RecipeEndPoint: APIEndPoint {
    var path: String {"eba85221-aeed-4c9e-abda-60ce833d3e41"}
    var method: String {"GET"}
    var queryItems: [URLQueryItem]? = nil
    var headers: [String : String]? = nil
    var body: Data? = nil
}

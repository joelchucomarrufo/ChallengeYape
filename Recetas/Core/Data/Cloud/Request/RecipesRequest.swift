//
//  RecipestRequest.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 22/05/24.
//

import Foundation

struct RecipesRequest: NetworkRequest {
        
    var endpoint: String { baseURL + "/api/recetas" }
    var httpHeaders: [String : String]
    var httpMethod: HTTPMethods { .get }
    
    init() {
        self.httpHeaders = [
            "Content-Type":"application/json",
            "Accept":"application/json"
        ]
    }
}

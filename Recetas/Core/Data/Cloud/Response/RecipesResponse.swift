//
//  RecipesResponse.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 22/05/24.
//

import Foundation

struct RecipesResponse: Codable {
    
    var recipes: [RecipeResponse]
        
}

struct RecipeResponse: Codable {
    
    var title: String?
    var ingredientes: [String]?
    var preparacion: [String]?
    var image: String?
    var latitude: String?
    var longitude: String?
        
}

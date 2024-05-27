//
//  MockRecipesPresenter.swift
//  RecetasTests
//
//  Created by Joel Martin Chuco Marrufo on 27/05/24.
//

import XCTest

class MockRecipesPresenter: RecipesPresenterProtocol {
    var delegate: RecipesPresenterDelegate?
    
    var shouldReturnError = false
    var recipes = [RecipeResponse]()
    
    func requestRecipes() {
        if shouldReturnError {
            delegate?.error(message: "Error fetching recipes")
        } else {
            delegate?.success(recipes: recipes)
        }
    }
}

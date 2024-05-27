//
//  MockRecipesUseCase.swift
//  RecetasTests
//
//  Created by Joel Martin Chuco Marrufo on 27/05/24.
//

import XCTest

class MockRecipesUseCase: RecipesUseCase {
    var mockPresenter: MockRecipesPresenter!
    
    override init() {
        mockPresenter = MockRecipesPresenter()
        super.init(presenter: mockPresenter)
    }
    
    func setRecipes(_ recipes: [RecipeResponse]) {
        mockPresenter.recipes = recipes
    }
    
    func setShouldReturnError(_ shouldReturnError: Bool) {
        mockPresenter.shouldReturnError = shouldReturnError
    }
}

//
//  HomeViewModelTests.swift
//  RecetasTests
//
//  Created by Joel Martin Chuco Marrufo on 27/05/24.
//

import XCTest
@testable import Recetas

class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var mockUseCase: MockRecipesUseCase!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockUseCase = MockRecipesUseCase()
        viewModel = HomeViewModel()
        viewModel.recipesUsecase = mockUseCase
        viewModel.recipesUsecase.eventDelegate = viewModel
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockUseCase = nil
        try super.tearDownWithError()
    }

    func testInitialValues() {
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.searchText.isEmpty)
        XCTAssertTrue(viewModel.recipeList.isEmpty)
        XCTAssertTrue(viewModel.recipeListFiltered.isEmpty)
    }

    func testRequestRecipesSetsLoading() {
        viewModel.requestRecipes()
        XCTAssertFalse(viewModel.isLoading)
    }

    func testFilterRecipesWithEmptySearchText() {
        let recipes = [RecipeModel(title: "Pizza", ingredientes: [], preparacion: [], image: "", latitude: "", longitude: ""), RecipeModel(title: "Pasta", ingredientes: [], preparacion: [], image: "", latitude: "", longitude: "")]
        viewModel.recipeList = recipes
        viewModel.searchText = ""
        XCTAssertEqual(viewModel.recipeListFiltered, recipes)
    }

    func testFilterRecipesWithSearchText() {
        let recipes = [RecipeModel(title: "Pizza", ingredientes: [], preparacion: [], image: "", latitude: "", longitude: ""), RecipeModel(title: "Pasta", ingredientes: [], preparacion: [], image: "", latitude: "", longitude: "")]
        viewModel.recipeList = recipes
        viewModel.searchText = "Piz"
        XCTAssertEqual(viewModel.recipeListFiltered.count, 1)
        XCTAssertEqual(viewModel.recipeListFiltered.first?.title, "Pizza")
    }

    func testEventSuccessUpdatesRecipeList() {
        let recipesResponse = [
            RecipeResponse(title: "Pizza", ingredientes: [], preparacion: [], image: "", latitude: "", longitude: ""),
            RecipeResponse(title: "Pasta", ingredientes: [], preparacion: [], image: "", latitude: "", longitude: "")
        ]
        mockUseCase.setRecipes(recipesResponse)
        viewModel.requestRecipes()
        mockUseCase.mockPresenter.requestRecipes()
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(viewModel.recipeList.count, 2)
        XCTAssertEqual(viewModel.recipeListFiltered.count, 2)
        XCTAssertEqual(viewModel.recipeList.first?.title, "Pizza")
    }

    func testEventErrorUpdatesLoading() {
        mockUseCase.setShouldReturnError(true)
        viewModel.requestRecipes()
        mockUseCase.mockPresenter.requestRecipes()
        
        XCTAssertFalse(viewModel.isLoading)
    }
}


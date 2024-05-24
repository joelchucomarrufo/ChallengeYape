//
//  HomeViewModel.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 23/05/24.
//

import Foundation


class HomeViewModel: ObservableObject{
    static let shared = HomeViewModel()
    
    @Published var isLoading = false
    @Published var searchText: String = "" {
        didSet {
            filterRecipes()
        }
    }
    @Published var recipeList: [RecipeModel] = []
    @Published var recipeListFiltered: [RecipeModel] = []
        
    var recipesUsecase = RecipesUseCase()
    
    init() {
        self.recipesUsecase.eventDelegate = self
        self.recipeList = []
        self.recipeListFiltered = []
    }
    
    func requestRecipes() {
        self.isLoading = true
        self.recipesUsecase.requestRecipes()
    }
    
    func filterRecipes() {
        print("*** searchText: ", searchText)
        if (searchText.isEmpty) {
            recipeListFiltered = recipeList
        } else {
            recipeListFiltered = recipeList.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

extension HomeViewModel : RecipesUseCaseDelegate {
    
    func eventSuccess(recipes: [RecipeModel]) {
        self.isLoading = false
        self.recipeList = recipes
        filterRecipes()
        print(recipeList)
    }
    
    func eventError(message: String) {
        self.isLoading = false
        print(message)
    }
    
}

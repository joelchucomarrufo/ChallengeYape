//
//  RecipesPresenter.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 22/05/24.
//

import Foundation

protocol RecipesPresenterProtocol {
    func requestRecipes()
    var delegate: RecipesPresenterDelegate? { get set }
}

protocol RecipesPresenterDelegate {
    func success(recipes: [RecipeResponse])
    func error(message: String)
}

protocol RecipesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func success(recipes: [RecipeResponse])
    func error(message: String)
    
}

class RecipesPresenter: BasePresenter {
    var interactor: RecipesInteractorInputProtocol? { return super.baseInteractor as? RecipesInteractorInputProtocol}
    var delegate: RecipesPresenterDelegate?
}

extension RecipesPresenter: RecipesPresenterProtocol {
  
    internal func requestRecipes() {
        interactor?.requestRecipes()
    }
}

extension RecipesPresenter: RecipesInteractorOutputProtocol {
    
    func error(message: String) {
        delegate?.error(message: message)
    }
    
    func success(recipes: [RecipeResponse]) {
        delegate?.success(recipes: recipes)
    }
}

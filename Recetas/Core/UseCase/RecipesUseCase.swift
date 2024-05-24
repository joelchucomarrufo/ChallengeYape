//
//  RecipesUseCase.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 22/05/24.
//

import Foundation

public protocol RecipesUseCaseDelegate: AnyObject {
    
    func eventSuccess(recipes: [RecipeModel])
    
    func eventError(message: String)
    
}

public class RecipesUseCase {

    var presenter: RecipesPresenterProtocol
    public weak var eventDelegate: RecipesUseCaseDelegate?
   
    public init() {
        self.presenter = RecipesCoordinator.build()
        self.presenter.delegate = self
    }
    
    init(presenter: RecipesPresenterProtocol) {
        self.presenter = presenter
        self.presenter.delegate = self
    }
    
    public func requestRecipes() {
        presenter.requestRecipes()
    }
    
}


extension RecipesUseCase: RecipesPresenterDelegate {
    
    func success(recipes: [RecipeResponse]) {
        eventDelegate?.eventSuccess(recipes: recipes.map { response in
            RecipeModel(
                title: response.title ?? "",
                ingredientes: response.ingredientes ?? [],
                preparacion: response.preparacion ?? [],
                image: response.image ?? "",
                latitude: response.latitude ?? "",
                longitude: response.longitude ?? "")
        })
    }
    
    
    func error(message: String) {
        eventDelegate?.eventError(message: message)
    }
}

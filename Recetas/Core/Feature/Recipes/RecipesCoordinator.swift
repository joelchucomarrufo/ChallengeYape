//
//  RecipesCoordinator.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 22/05/24.
//

import Foundation

final class RecipesCoordinator: BaseCoordinator {
    
    static func build() -> RecipesPresenter {
        let vip = BaseCoordinator.assemblyPresenter(presenter: RecipesPresenter.self, interactor: RecipesInteractor.self)
        vip.interactor.recipesProvider = RecipesProvider()
        return vip.presenter
    }
    
}

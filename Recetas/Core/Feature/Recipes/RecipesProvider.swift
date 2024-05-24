//
//  RecipesProvider.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 22/05/24.
//

import Foundation
import Combine

protocol RecipesProviderProtocol {
    
    func requestRecipes<R: NetworkRequest>(request: R) -> AnyPublisher<RecipesResponse,NetworkingError>
    
}

class RecipesProvider {
    
    var networkManager : NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
}

extension RecipesProvider: RecipesProviderProtocol {

    internal func requestRecipes<R>(request: R) -> AnyPublisher<RecipesResponse, NetworkingError> where R:NetworkRequest {
        
        return self.networkManager.requestGeneric(request: request, entity: RecipesResponse.self)
            .map { response in
                return Just(response)
                .setFailureType(to: NetworkingError.self)
                .eraseToAnyPublisher()
            }
            .switchToLatest()
            .eraseToAnyPublisher()
    }

}

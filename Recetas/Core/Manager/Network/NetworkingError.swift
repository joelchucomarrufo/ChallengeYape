//
//  NetworkingError.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 22/05/24.
//

import Foundation

enum NetworkingError: Error {
    case custom(String)
    case httpError(Int)
    case unknown
}

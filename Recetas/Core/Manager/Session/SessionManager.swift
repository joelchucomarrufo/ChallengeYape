//
//  SessionManager.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 22/05/24.
//

import Foundation

class SessionManager: Codable {
    
    static var shared = SessionManager()
    private static let  sessionTime: Double? = 300.0
    var baseURL: String?
        
    private init() {
        baseURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String
    }
}

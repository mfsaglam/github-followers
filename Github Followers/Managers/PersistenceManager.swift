//
//  PersistenceManager.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 31.05.2022.
//

import Foundation

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData  = defaults.object(forKey: "favorites") else {
            
        }
    }
}

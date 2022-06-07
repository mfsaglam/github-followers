//
//  PersistenceManager.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 31.05.2022.
//

import Foundation

enum PersistenceManager {
    
    enum Keys {
        static let favorites = "favorites"
    }
    static private let defaults = UserDefaults.standard
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData  = defaults.object(forKey: Keys.favorites ) else {
            
        }
    }
}

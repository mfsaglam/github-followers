//
//  NetworkManager.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 9.05.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseUrl = "https://api.github.com/users/"
    
    private init() { }
    
    func getFollowers(for username: String, page: Int, conpletionHandler: @escaping ([Follower], String) -> Void) {
        
    }
}

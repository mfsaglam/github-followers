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
    
    func getFollowers(for username: String, page: Int, completionHandler: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseUrl + "users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completionHandler(nil, "invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completionHandler(nil, "unable to complete request, check internet connection")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(nil, "invalid response from the server. Please try again later.")
                return
            }
            
            guard let data = data else {
                completionHandler(nil, "The data received from the server was invalid.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let followers = try decoder.decode([Follower].self, from: data)
                completionHandler(followers, nil)
            } catch {
                completionHandler(nil, "The data received from the server was invalid.")
            }
        }
        
        task.resume()
    }
}

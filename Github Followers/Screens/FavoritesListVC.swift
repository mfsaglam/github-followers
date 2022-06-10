//
//  FavoritesListVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 6.05.2022.
//

import UIKit

class FavoritesListVC: UIViewController {
    
    let tableView = UITableView()
    var favorites: [Follower] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        getFavorites()
    }
    
    func configure() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                self.favorites = favorites
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    func configureTableView() {
        
    }
}

//
//  GFTabBarController.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 11.06.2022.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemBlue
        viewControllers = [createSearchVC(), createFavoritesListVC()]
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = .some(UIBlurEffect(style: .systemThinMaterial))
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
    }
    
    func createSearchVC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesListVC() -> UINavigationController {
        let favoritesListVC = FavoritesListVC()
        favoritesListVC.title = "Favorites"
        favoritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesListVC)
    }
}

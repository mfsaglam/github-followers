//
//  FollowerListVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 6.05.2022.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.shared.getFollowers(for: username ?? "", page: 1) { followers, error in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error ?? "", buttonTitle: "ok")
                return
            }
            
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.isNavigationBarHidden = false
    }
}

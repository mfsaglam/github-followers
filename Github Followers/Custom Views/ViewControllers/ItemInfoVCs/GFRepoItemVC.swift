//
//  GFRepoItemVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 3.06.2022.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(type: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(type: .gists, with: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func actionButtonTapped() {
        delegate?.didTapGithubProfile(user: user)
    }
}

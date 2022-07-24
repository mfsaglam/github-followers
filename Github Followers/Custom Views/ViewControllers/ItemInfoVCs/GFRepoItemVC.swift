//
//  GFRepoItemVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 3.06.2022.
//

import UIKit

protocol GFRepoItemVCDelegate: AnyObject {
    func didTapGithubProfile(user: User)
}

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    weak var delegate: GFRepoItemVCDelegate?
    
    private func configureItems() {
        itemInfoViewOne.set(type: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(type: .gists, with: user.publicGists)
        actionButton.set(color: .systemPurple, title: "Github Profile", systemImageName: "person")
    }
    
    override func actionButtonTapped() {
        delegate?.didTapGithubProfile(user: user)
    }
}

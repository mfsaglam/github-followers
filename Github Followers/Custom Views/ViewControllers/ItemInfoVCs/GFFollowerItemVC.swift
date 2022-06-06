//
//  GFFollowerItemVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 4.06.2022.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(type: .followers, with: user.followers)
        itemInfoViewTwo.set(type: .following, with: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate?.didTapGetFollowers()
    }
}

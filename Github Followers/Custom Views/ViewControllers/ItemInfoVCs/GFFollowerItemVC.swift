//
//  GFFollowerItemVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 4.06.2022.
//

import UIKit

protocol GFFollowerItemVCDelegate: AnyObject {
    func didTapGetFollowers(user: User)
}

class GFFollowerItemVC: GFItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    weak var delegate: GFFollowerItemVCDelegate?
    
    private func configureItems() {
        itemInfoViewOne.set(type: .followers, with: user.followers)
        itemInfoViewTwo.set(type: .following, with: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        guard user.followers != 0 else {
            presentGFAlert(title: "Something went wrong", message: "This user has no followes, go follow them.", buttonTitle: "Ok")
            return
        }
        delegate?.didTapGetFollowers(user: user)
        dismiss(animated: true)
    }
    
    
}

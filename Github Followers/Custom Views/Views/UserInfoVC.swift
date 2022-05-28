//
//  UserInfoVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 28.05.2022.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var avatarImageView = GFAvatarImageView(frame: .zero)
    var usernameLabel = GFTitleLabel(alignment: .left, fontSize: 34)
    var nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    var locationImageView = UIImage()
    var bioLabel = GFBodyLabel(alignment: .left)
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

//
//  FavoriteCell.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 9.06.2022.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    static let reuseID = "FavoriteCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(alignment: .left, fontSize: 26)

}

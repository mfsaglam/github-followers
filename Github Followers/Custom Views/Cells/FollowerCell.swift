//
//  FollowerCell.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 12.05.2022.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImageView = UIImageView()
    let usenameLabel = GFTitleLabel(alignment: .left, fontSize: 16)
}

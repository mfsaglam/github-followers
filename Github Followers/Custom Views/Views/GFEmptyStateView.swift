//
//  GFEmptyStateView.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 20.05.2022.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let message = GFTitleLabel(alignment: .center, fontSize: 28)
    let image = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(message)
        addSubview(image)
        
        message.numberOfLines = 3
        message.textColor = .secondaryLabel
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "empty-state-logo")
    }
}

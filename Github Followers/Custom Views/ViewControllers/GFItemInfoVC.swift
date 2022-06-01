//
//  GFItemInfoVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 2.06.2022.
//

import UIKit

class GFItemInfoVC: UIViewController {
    
    let stackView = UIStackView()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let actionButton = GFButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        layoutUI()
    }
    
    private func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func layoutUI() {
        view.addSubview(stackView)
        view.addSubview(itemInfoViewOne)
        view.addSubview(itemInfoViewTwo)
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
        
        ])
    }
}

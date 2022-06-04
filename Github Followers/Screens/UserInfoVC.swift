//
//  UserInfoVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 25.05.2022.
//

import UIKit

class UserInfoVC: UIViewController {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureUI()
        getUser()
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func getUser() {
        NetworkManager.shared.getUser(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    let userInfoHeaderView = UserInfoHeaderVC(user: user)
                    self.add(childVC: userInfoHeaderView, to: self.headerView)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "ok")
            }
        }
    }
    
    func configureUI() {
        let padding: CGFloat = 20
        let containerHeight: CGFloat = 140
        
        let uiViews: [UIView] = [headerView, itemViewOne, itemViewTwo]
        
        itemViewOne.backgroundColor = .systemPink
        itemViewTwo.backgroundColor = .systemBlue
        
        for uiView in uiViews {
            view.addSubview(uiView)
            uiView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                uiView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                uiView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: containerHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: containerHeight),
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}

//
//  UserInfoVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 25.05.2022.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject {
    func didRequestFollowers(for username: String)
}

class UserInfoVC: UIViewController {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(alignment: .center)
    
    var username: String!
    
    weak var delegate: UserInfoVCDelegate?
    
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
        
        Task {
            do {
                let user = try await NetworkManager.shared.getUser(for: username)
                configureUIElements(with: user)
            } catch {
                if let gfError = error as? GFError {
                    presentGFAlert(title: "Something went wrong", message: gfError.rawValue, buttonTitle: "Ok")
                } else {
                    presentDefaultErrorGFAlert()
                }
            }
        }
    }
    
    func configureUIElements(with user: User) {
        let userInfoHeaderView = UserInfoHeaderVC(user: user)
        let repoItemVC = GFRepoItemVC(user: user)
        let followerItemVC = GFFollowerItemVC(user: user)
        
        repoItemVC.delegate = self
        followerItemVC.delegate = self
        
        self.add(childVC: userInfoHeaderView, to: self.headerView)
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followerItemVC, to: self.itemViewTwo)
        self.dateLabel.text = "GitHub Since \(user.createdAt.convertToMonthYearFormat())"
    }
    
    func configureUI() {
        let padding: CGFloat = 20
        let containerHeight: CGFloat = 140
        
        let uiViews: [UIView] = [headerView, itemViewOne, itemViewTwo, dateLabel]
        
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
            headerView.heightAnchor.constraint(equalToConstant: 210),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: containerHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: containerHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}

extension UserInfoVC: GFRepoItemVCDelegate, GFFollowerItemVCDelegate {
    func didTapGithubProfile(user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlert(title: "Url is invalid.", message: "Please check url is correct or try again later.", buttonTitle: "Ok")
            return
        }
        presentSafariVC(with: url)
    }
    
    func didTapGetFollowers(user: User) {
        delegate?.didRequestFollowers(for: user.login)
    }
}



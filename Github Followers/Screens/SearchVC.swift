//
//  SearchVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 6.05.2022.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let getFollowersButton = GFButton(color: .systemBlue, title: "Get Followers", systemImageName: "person.3")
    
    var logoImageViewTopConstaint: NSLayoutConstraint!
    
    var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegates()
        configureUI()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func createDismissKeyboardTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture )
    }
    
    @objc func pushFollowerListVC() {
        
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "No username entered", message: "Please enter a username and try again.", buttonTitle: "Ok")
            return
        }
        

        let followerListVC = FollowerListVC(username: usernameTextField.text!)

        usernameTextField.resignFirstResponder()
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    private func configureDelegates() {
        usernameTextField.delegate = self
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubviews(logoImageView, usernameTextField, getFollowersButton)
        
        getFollowersButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside )
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = Images.ghLogo
        
        let topConstraintConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 80
        
        logoImageViewTopConstaint = logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstraintConstant)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            getFollowersButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            getFollowersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            getFollowersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            getFollowersButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}

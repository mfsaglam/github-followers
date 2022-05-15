//
//  FollowerListVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 6.05.2022.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String?
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        getFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViewController()
    }
    
    private func configureViewController() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getThreeColumnFlowLayout() -> UICollectionViewLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        let itemHeight = availableWidth + 40
        
        let threeColumnFlowLayout = UICollectionViewFlowLayout()
        threeColumnFlowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        threeColumnFlowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        return threeColumnFlowLayout
    }
    
    private func getFollowers() {
        NetworkManager.shared.getFollowers(for: username ?? "", page: 1) { result in
            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue , buttonTitle: "ok")
            }
        }
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: getThreeColumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "FollowerCell")
    }
}

//
//  FollowerListVC.swift
//  Github Followers
//
//  Created by Fatih Sağlam on 6.05.2022.
//

import UIKit

class FollowerListVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var username: String!
    var followers: [Follower] = []
    var page = 1
    var hasMoreFollower = true
    var filteredFollowers : [Follower] = []
    
    var diffableDataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        getFollowers(username: username, page: page)
        configureDiffableDataSource()
        configureSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViewController()
    }
    
    private func configureViewController() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func getFollowers(username: String, page: Int) {
        showLoadingView()
        NetworkManager.shared.getFollowers(for: self.username ?? "", page: page) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let followers):
                self.followers = followers
                if self.followers.isEmpty {
                    let message = "This user has no followers. Go follow them."
                    DispatchQueue.main.async {
                        self.showEmptyStateView(with: message, in: self.view)
                        return
                    }
                }
                
                if followers.count < 100 { self.hasMoreFollower = false }
                self.followers.append(contentsOf: followers)
                self.updateData(data: followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue , buttonTitle: "ok")
            }
        }
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.getThreeColumnFlowLayout(in: view))
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    func configureDiffableDataSource() {
        diffableDataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView) { collectionView, indexPath, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        }
    }
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a username"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    func updateData(data: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(data)
        DispatchQueue.main.async {
            self.diffableDataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}

extension FollowerListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollower else { return }
            page += 1
            getFollowers(username: username, page: page)
        }
    }
}

extension FollowerListVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            updateData(data: followers)
            return
        }
        filteredFollowers = followers.filter { $0.login.lowercased().contains(filter.lowercased()) }
        updateData(data: filteredFollowers)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        updateData(data: followers)
    }
}

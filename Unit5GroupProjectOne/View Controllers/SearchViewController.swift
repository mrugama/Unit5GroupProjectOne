//
//  SearchViewController.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class SearchViewController: UIViewController {
    
    let searchView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()
        constrainView()
        delegateAndDataSource()
        configureNavBar()
    }
    
    private func configureNavBar() {
        //TODO: Edit title
        navigationItem.title = "Venue Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController?.searchBar.placeholder = "Search for a venue"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "tableview icon"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(venueListButton))
    }
    @objc func venueListButton() {
        let modalVC = UIViewController()
        let navController = UINavigationController(rootViewController: modalVC)
        modalVC.view.backgroundColor = .white
        self.present(navController, animated: true, completion: nil)
    }
    private func delegateAndDataSource() {
//        searchView.venueSearchBar.delegate = self
        searchView.locationSearchBar.delegate = self
        searchView.venueCollectionView.delegate = self
        searchView.venueCollectionView.dataSource = self
    }
    private func constrainView() {
        view.addSubview(searchView)
        searchView.backgroundColor = .cyan
        searchView.snp.makeConstraints { (view) in
            view.top.bottom.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath)
        cell.contentView.backgroundColor = .gray
        return cell
    }
    
}
extension SearchViewController: UISearchBarDelegate {
    
}

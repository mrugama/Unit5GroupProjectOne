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
    
    private let cellSpacing: CGFloat = UIScreen.main.bounds.width * 0.02
    
    private let searchView = SearchView()

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
    @objc private func venueListButton() {
        let modalVC = VenueListViewController() //to do: the initializer for this view controller should take in the current results (the data source variable) and pass them to this view controller, so it has a datasource variable for its own table view
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

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCells: CGFloat = 4.5
        let numberOfSpaces: CGFloat = numberOfCells + 1
        let width = (collectionView.bounds.width - (numberOfSpaces * cellSpacing)) / numberOfCells
        let height = width
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
    }
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 //to do: change when we have a working datasource variable!!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as! SearchCollectionViewCell
        cell.contentView.backgroundColor = .gray
        return cell
    }
    
}
extension SearchViewController: UISearchBarDelegate {
    
}

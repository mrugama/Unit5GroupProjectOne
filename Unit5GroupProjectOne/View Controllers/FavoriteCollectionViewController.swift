//
//  FavoriteCollectionViewController.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

//Message by Melissa: This will be the view controller that displays the collection view (the second tab)

class FavoriteCollectionViewController: UIViewController {
    
    private let cellSpacing: CGFloat = UIScreen.main.bounds.width * 0.02
    private let favoriteView = VenueCollectionView()
    
        //set up the did select delegate method so that clicking one collection view cell should segue to a detail view that lists all the venues
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteView.venueCollectionView.dataSource = self
        favoriteView.venueCollectionView.delegate = self
        constraints()
        navigationItem.title = "My Collection"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createCollection))
    }
    @objc private func createCollection() {
        let modalVC = CreateFavoriteViewController() //to do: the initializer for this view controller should take in the current results (the data source variable) and pass them to this view controller, so it has a datasource variable for its own table view
        let navController = UINavigationController(rootViewController: modalVC)
        modalVC.view.backgroundColor = .white
        self.present(navController, animated: true, completion: nil)
    }
    private func constraints() {
        view.addSubview(favoriteView)
        let safe = view.safeAreaLayoutGuide
        favoriteView.snp.makeConstraints { (view) in
            view.top.bottom.leading.trailing.equalTo(safe)
        }
        
    }
    
}
extension FavoriteCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VenueCollectionCell", for: indexPath) as! VenueCollectionViewCell
        cell.configureCell()
        return cell
    }
    
}
extension FavoriteCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCells: CGFloat = 2
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
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
    }
}

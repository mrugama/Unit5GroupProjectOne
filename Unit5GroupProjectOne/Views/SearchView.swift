//
//  SearchView.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import MapKit

class SearchView: UIView {
    
    lazy var venueCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionCell")
        return cv
    }()
    
    lazy var venueSearchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.placeholder = "Search for a venue"
        return searchbar
    }()
    
    lazy var locationSearchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.placeholder = "Queens, NY"
        searchbar.barTintColor = .white
        return searchbar
    }()
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.showsUserLocation = true
        return map
    }()
    
    lazy var userTrackingButton: MKUserTrackingButton = {
        let trackingButton = MKUserTrackingButton()
        return trackingButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    private func setupViews() {
        let viewObjects = [locationSearchBar, venueSearchBar, mapView, userTrackingButton, venueCollectionView] as [UIView]
        viewObjects.forEach{addSubview($0)}
        
        locationSearchBar.snp.makeConstraints { (location) in
            location.top.leading.trailing.equalTo(self)
            location.height.equalTo(40)
        }
        mapView.snp.makeConstraints { (map) in
            map.top.equalTo(locationSearchBar.snp.bottom)
            map.trailing.leading.bottom.equalTo(self)
        }
        venueCollectionView.snp.makeConstraints { (collection) in
            collection.bottom.equalTo(self).offset(-10)
            collection.trailing.leading.centerX.equalTo(self)
            collection.height.equalTo(75)
        }
        userTrackingButton.snp.makeConstraints { (tracking) in
            tracking.trailing.bottom.equalTo(self).offset(-16)
        }
    }

}

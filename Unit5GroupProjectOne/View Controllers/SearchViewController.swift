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
    
    private lazy var venueSearchBarController = UISearchController(searchResultsController: nil)
    
    private var venues: [Venue] = [] {
        didSet {
            searchView.venueCollectionView.reloadData()
            
            //should create a list of annotations from these venues
            //should assign that list to self.annotations (replacing the old list!)
            
            var annotations: [MKAnnotation] = []
            
            for venue in venues {
                let annotation = MKPointAnnotation()
                
                annotation.coordinate = CLLocationCoordinate2D(latitude: venue.location.lat, longitude: venue.location.lng)
                
                annotation.title = venue.name
                annotation.subtitle = venue.categories.map{$0.shortName}.joined(separator: ", ")
                
                annotations.append(annotation)
            }
            
            searchView.mapView.removeAnnotations(self.annotations)
            
            self.annotations = annotations
            
        }
    }
    
    private var annotations: [MKAnnotation] = [] {
        didSet {
            //when this changes
                //should remove the old pins from the map
                //should replace the old pins in the map with new annotations!!
            
            searchView.mapView.addAnnotations(annotations)
            searchView.mapView.showAnnotations(annotations, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constrainView()
        configureNavBar()
        delegateAndDataSource()
        setUpLocationServices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let _ = LocationService.manager.checkAuthorizationStatusAndLocationServices()
    }
    
}

//MARK: - Helper Functions
extension SearchViewController {
    
    private func configureNavBar() {
        //TODO: Edit title
        navigationItem.title = "Venue Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        venueSearchBarController.searchBar.delegate = self
        navigationItem.searchController = venueSearchBarController
        navigationItem.searchController?.isActive = true
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
        navigationItem.searchController?.searchBar.delegate = self
        searchView.locationSearchBar.delegate = self
        searchView.venueCollectionView.delegate = self
        searchView.venueCollectionView.dataSource = self
        LocationService.manager.delegate = self
        
    }
    
    private func constrainView() {
        view.addSubview(searchView)
        searchView.backgroundColor = .cyan
        searchView.snp.makeConstraints { (view) in
            view.top.bottom.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    private func setUpLocationServices() {
        let locationService = LocationService.manager.checkAuthorizationStatusAndLocationServices()
        
        if locationService.locationServicesEnabled {
            switch locationService.authorizationStatus {
            case .denied:
                presentSettingsAlertController(withTitle: "Location Services Not Enabled", andMessage: "Please enable Location Services in Settings for better search results.")
            case .restricted:
                let alertController = UIAlertController(title: "Warning", message: "This app is not authorized to use location services.", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alertController.addAction(alertAction)
                
                self.present(alertController, animated: true, completion: nil)
                
            default:
                break
            }
        }
    }
    
    private func presentSettingsAlertController(withTitle title: String?, andMessage message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: "Settings", style: .default, handler: { (_) in
            
            guard let settingsURL = URL(string: UIApplicationOpenSettingsURLString) else {
                return
            }
            
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func createAlertController(withTitle title: String?, andMessage message: String?) -> UIAlertController {
    
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    private func getVenues(fromSearchTerm searchTerm: String, latitude: Double, andLongitude longitude: Double) {
        
        //make sure to format search term!!
        
        //to do - update
//        VenueAPIClient.manager.getVenue(from: searchTerm, lat: latitude, lon: longitude, completionHandler: { (venues) in
//
//            self.venues = venues
//
//        }, errorHandler: { (error) in
//
//
//            //TODO: Present the alert
//
//        })
//
    }
    
}

//MARK: - Location Service Delegate Methods
extension SearchViewController: LocationServiceDelegate {
    
    //Melissa to QA: Please check if this doesn't make the alert pop up too often! Thanks!!
    func locationServiceAuthorizationStatusChanged(toStatus status: CLAuthorizationStatus) {
        print(status)
        
        switch status {
        case .denied:
            if self.presentedViewController == nil {
                presentSettingsAlertController(withTitle: "Location Services Not Enabled", andMessage: "Please enable Location Services in Settings for better search results.")
            }
        case .restricted:
            let alertController = UIAlertController(title: "Warning", message: "This app is not authorized to use location services.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertController.addAction(alertAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        default:
            break
        }
        
    }
    
    func userLocationUpdateFailed(withError error: Error) {
        print(error)
        
        presentSettingsAlertController(withTitle: "Could Not Get User Location", andMessage: "Please enable Location Services in Settings or check network connectivity.")
    }
    
    func userLocationUpdatedToLocation(_ location: CLLocation) {
        
        let userCoordinates = searchView.mapView.userLocation.coordinate
        
        let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        searchView.mapView.showsUserLocation = true
        
        let userRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userCoordinates.latitude, longitude: userCoordinates.longitude), span: mapSpan)
        
        searchView.mapView.setRegion(userRegion, animated: true)
        
        //TODO: set the place holder everytime the current location changes!! - use the geocoder to find the actual place!
        //TODO: fix user tracking button
        
    }
    
}

//MARK: - Map View Delegate Methods
//TODO: Make Map View Delegate Methods
//should have a map manager or something? need a map delegate!!
//should check the map view's view that is return for each annotation!

extension SearchViewController: MKMapViewDelegate {
    //to do!!
}


//MARK: - Collection View Delegate Flow Layout Methods
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

//MARK: - Collection View Delegate and Data Source Methods
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return venues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as! SearchCollectionViewCell
        cell.contentView.backgroundColor = .gray
        
        return cell
    }
    
}

//TODO: Finish Search Bar Delegate
    //tapping search should get the list of venues, and changing the list of venues
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //probably should set up user preferences to save last search and last location (lol)
        
        guard
            let venueSearchText = venueSearchBarController.searchBar.text,
            !venueSearchText.isEmpty,
            let formattedVenueSearchText = venueSearchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            else {

            return
        }
        
        guard
            let locationSearchText = searchView.locationSearchBar.text,
            !locationSearchText.isEmpty
            else {
            
                let locationService = LocationService.manager.checkAuthorizationStatusAndLocationServices()
                
                //if location services is enabled - do search
                if locationService.locationServicesEnabled && (locationService.authorizationStatus == .authorizedAlways || locationService.authorizationStatus == .authorizedWhenInUse) {
                    //if user location access is allowed
                    
                    //do search
                    
                } else {
                    //if location services is not enabled - present alert controller
                    
                }
            
            return
        }
        
        //if user enters location
        LocationService.manager.getLatAndLong(fromLocation: locationSearchText) { (error, coordinate) in
        
            if let error = error {
                //present alert that says could not get coordinates from user inputted location
                return
            }
            
            if let coordinate = coordinate {
                
                self.getVenues(fromSearchTerm: formattedVenueSearchText, latitude: coordinate.latitude, andLongitude: coordinate.longitude)
                
            }
            
        }
        
    }
    
}

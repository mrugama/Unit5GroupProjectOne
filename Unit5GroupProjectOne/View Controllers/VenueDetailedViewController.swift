//
//  VenueDetailedViewController.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

//Message by Melissa: This is the view controller that displays the detailed view

class VenueDetailedViewController: UIViewController {

    let detailView = VenueDetailedView()
    var venueDetail = [String]() {
        didSet {
            self.detailView.VenueDetailTableView.reloadData()
        }
    }
    
    var venue: Venue!
    var venueImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        constrainView()
        detailView.VenueDetailTableView.dataSource = self
        detailView.VenueDetailTableView.delegate = self
        navigationItem.title = venue.name
        //detailView.VenueDetailTableView.rowHeight = 50
    }
    
    @objc private func AddButtonPressed() {
        let addTipVC = AddCollectionTipViewController(venue: self.venue, VC: self, venueImage: self.venueImage)
        
        let navVC = UINavigationController(rootViewController: addTipVC)
        
        navigationController?.present(navVC, animated: true, completion: nil)
    }
    
    private func constrainView() {
        view.addSubview(detailView)
        
        detailView.snp.makeConstraints { (view) in
            view.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
}

extension VenueDetailedViewController {
    public func configureView(venue: Venue, tip: String?, saved: Bool) {
        
        if !saved {
            navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(AddButtonPressed))
        }
        
        self.venue = venue
        
        PhotoAPIClient.manager.getPhotos(venue: venue.id) { (photo) in
            if let photo = photo?.first {
                let photoURL = "\(photo.prefix)\(photo.width)x\(photo.height)\(photo.suffix)"
                var index = 0
                self.venueDetail.insert(photoURL, at: index)
                index += 1
                let category = self.venue.categories.map{$0.shortName}.joined(separator: ", ").replacingOccurrences(of: "/", with: "")
                self.venueDetail.insert(category, at: index)
                index += 1
                if let tip = tip {
                    self.venueDetail.insert(tip, at: index)
                    index += 1
                }
//                else {
//                    self.venueDetail.insert("Add a tip!", at: index)
//                }
                
                if let address = venue.location.formattedAddress {
                    self.venueDetail.insert(address.joined(separator: ", "), at: index)
                    index += 1
                } else {
                    self.venueDetail.insert("No Address Available", at: index)
                    index += 1
                }
            }
        }
        
    }
}

extension VenueDetailedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return view.layer.bounds.height * 0.70
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: open maps
    }
}

extension VenueDetailedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venueDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { 
        let venue = venueDetail[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? VenueDetailedTableViewCell {
            if indexPath.row == 0 {
                if let urlImage = URL(string: venue) {
                    cell.venueImage.image = nil
                    cell.venueImage.kf.indicatorType = .activity
                    cell.venueImage.kf.setImage(with: urlImage, placeholder: UIImage.init(named: "placeholder"), options: nil, progressBlock: nil, completionHandler: { (image, error, cache, url) in
                        cell.layoutIfNeeded()
                        cell.detailDescriptionLabel.text = nil
                        if let image = image {
                            self.venueImage = image
                        } else {
                            self.venueImage = #imageLiteral(resourceName: "placeholder")
                        }
                    })
                }
            } else {
                cell.detailDescriptionLabel.text = venue
            }
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell
        }
        return UITableViewCell()
    }
    
    
}

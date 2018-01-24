//
//  VenueDetailedView.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

//Message by Melissa: this should have all the detailed information about the venues after selecting them from the from the search tab

class VenueDetailedView: UIView {
    
    //to do
        //set up initializers, etc.
        //set up properties - it should have at least these properties:
   
    var venueDetail = [String]() {
        didSet {
            self.VenueDetailTableView.reloadData()
        }
    }

    lazy var VenueDetailTableView: UITableView = {
        let tv = UITableView()
        tv.register(VenueDetailedTableViewCell.self, forCellReuseIdentifier: "DetailCell")
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        addSubview(VenueDetailTableView)
        
        VenueDetailTableView.snp.makeConstraints { (tableView) in
            tableView.edges.equalTo(self)
        }
    }
    
}

extension VenueDetailedView {
    public func configureView(venue: Venue, tip: String?) {
        PhotoAPIClient.manager.getPhotos(venue: venue.id) { (photo) in
            if let photo = photo?.first {
                let photoURL = "\(photo.prefix)\(photo.width)x\(photo.height)\(photo.suffix)"
                self.venueDetail.append(photoURL)
            }
        }
        venueDetail.append(venue.categories[0].name)
        if let tip = tip {
            venueDetail.append(tip)
        }
        if let address = venue.location.address {
            venueDetail.append(address)
        }
        
    }
}

extension VenueDetailedView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? VenueDetailedTableViewCell {
            let venue = venueDetail[indexPath.row]
            cell.venueImage.image = nil
            if indexPath.row == 0 {
                if let urlImage = URL(string: venue) {
                    cell.venueImage.kf.indicatorType = .activity
                    cell.venueImage.kf.setImage(with: urlImage, placeholder: UIImage.init(named: "defaultImage"), options: nil, progressBlock: nil, completionHandler: { (image, error, cache, url) in
                        cell.detailDescriptionLabel.text = nil
                    })
                    
                }
            } else {
                cell.detailDescriptionLabel.text = venue
            }
            return cell
        }
        return UITableViewCell()
    }
}


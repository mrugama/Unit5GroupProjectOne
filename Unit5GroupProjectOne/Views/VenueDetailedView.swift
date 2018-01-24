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
            //venue image
            //some label that has info/description about the venue
            //"Leave A Tip" - label
            //text view below that lets you write tips/edit existing tips!!
        //add constraints
    
//    lazy var venueTableView: UITableView = {
//        let venueTv = UITableView()
//        //venueTv.dataSource = self
//        //venueTv.delegate = self
//        venueTv.register(VenueTableViewCell.self, forCellReuseIdentifier: "VenueCell")
//        return venueTv
//    }()
    
    lazy var venueImage: UIImageView = {
        let venueImage = UIImageView()
        venueImage.contentMode = .scaleAspectFill
        return venueImage
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
        addSubview(venueImage)
        venueImage.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    

    
//    func layoutTableView() {
//        venueTableView.translatesAutoresizingMaskIntoConstraints = false
//        venueTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
//        venueTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
//        venueTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
//        venueTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
//    }
    
}
//extension VenueDetailedView {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //TODO: venue.count
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "VeneuCell", for: indexPath) as! VenueTableViewCell
//        //TODO:
//        return cell
//    }
//
//}

extension VenueDetailedView {
    public func configureView(photo: Photo) {
        
    }
}


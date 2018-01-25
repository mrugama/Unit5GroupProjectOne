//
//  VenueDetailedTableViewCell.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class VenueDetailedTableViewCell: UITableViewCell {
    //some labels that have info/description about the venue
    //add constraints
    
    
    lazy var venueImage: UIImageView = {
        let venueImage = UIImageView()
        venueImage.contentMode = .scaleToFill
        venueImage.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        venueImage.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        venueImage.setContentHuggingPriority(.defaultLow, for: .vertical)
        venueImage.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return venueImage
    }()
    
    lazy var detailDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        return label
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "DetailCell")
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
        addSubview(detailDescriptionLabel)
        
        venueImage.snp.makeConstraints { (image) in
            image.top.leading.trailing.equalTo(self)
            image.height.lessThanOrEqualTo(self.bounds.height / 2)
        }
        detailDescriptionLabel.snp.makeConstraints { (label) in
            label.top.equalTo(venueImage.snp.bottom)
            label.bottom.trailing.leading.equalTo(self)
            label.height.equalTo(50)
        }
    }
}

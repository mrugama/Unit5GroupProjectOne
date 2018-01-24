//
//  VenueDetailedTableViewCell.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class VenueDetailedTableViewCell: UITableViewCell {

    //some label that has info/description about the venue
    //"Leave A Tip" - label
    //text view below that lets you write tips/edit existing tips!!
    //add constraints
    
    lazy var venueImage: UIImageView = {
        let venueImage = UIImageView()
        venueImage.contentMode = .scaleAspectFill
        return venueImage
    }()
    
    lazy var detailDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        return label
    }()
    
    //TODO: setup textview
    lazy var detailTextView: UITextView = {
        let textView = UITextView()
        return textView
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
        }
        detailDescriptionLabel.snp.makeConstraints { (label) in
            label.bottom.trailing.leading.equalTo(self)
        }
    }
}

//
//  VenueTableViewCell.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

//Message by Melissa: the table view cell that will be used to display the search results and also the list of collected venues (like in your collections tab, you see all your saved collections. and then when you tap a collection view cell, it should segue to a table view of the venues you saved for that collection)

class VenueTableViewCell: UITableViewCell {

    lazy var venueImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .cyan
        return image
    }()
    lazy var venueName: UILabel = {
        let label = UILabel()
        label.text = "Restaurant"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    lazy var categoryName: UILabel = {
        let label = UILabel()
        label.text = "Thai"
        label.textColor = UIColor(displayP3Red: 0.537, green: 0.537, blue: 0.537, alpha: 1)
        label.font.withSize(15)
        return label
    }()
        //set up properties
        //set up 
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "VenueListCell")
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
        let viewObjects = [venueName, venueImage, categoryName] as! [UIView]
        viewObjects.forEach{addSubview($0)}
        
        venueImage.snp.makeConstraints { (image) in
            image.height.width.equalTo(120)
            image.top.leading.equalTo(5)
        }
        venueName.snp.makeConstraints { (label) in
            label.top.equalTo(5)
            label.leading.equalTo(self.venueImage.snp.trailing).offset(5)
        }
        categoryName.snp.makeConstraints { (label) in
            label.top.equalTo(self.venueName.snp.bottom).offset(5)
            label.leading.equalTo(self.venueImage.snp.trailing).offset(5)
        }
        
    }
    

    //maybe can be used for animations?? - who knows?? - to do for later
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}

//
//  SearchCollectionViewCell.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

//Message by Melissa: this will be for the collection view that is seen in the search tab

class SearchCollectionViewCell: UICollectionViewCell {
    
    lazy var searchCellImage: UIImageView = {
        let image = UIImageView()
        //TODO: set image
        image.image = #imageLiteral(resourceName: "placeholder")
        return image
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
        addSubview(searchCellImage)
        searchCellImage.snp.makeConstraints { (image) in
            image.top.bottom.leading.trailing.equalTo(self)
        }
    }
        //set up initializers (so that you can register them to collection views)
        //set up collection view properties and constraints
        //maybe add a "configure cell" function here that takes in some parameter and sets up the property for you, instead of having to do all that in the cellForItemAt datasource method in the view controller (to avoid cluttering the view controller, and having a cell that is more reusable)

    public func configureCell(withVenue venue: Venue) {
        //will use the photo api client - which should check for cache
        
        //TODO: set up image with photo api client - which should probably return
        
    }
    
}

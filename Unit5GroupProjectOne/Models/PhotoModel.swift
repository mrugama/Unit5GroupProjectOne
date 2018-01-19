//
//  PhotoModel.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct allPhotos: Codable {
    var photo: Photo
    
}

struct Photo: Codable {
    var id: String
    var prefix: String
    var suffix: String
    var width: Int
    var hight: Int
}

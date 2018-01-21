//
//  PhotoModel.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct AllPhotos: Codable {
    let response: Response
}

struct Response: Codable {
    let photo: Photo
}

struct Photo: Codable {
    var id: String
    var prefix: String
    var suffix: String
    var width: Int
    var hight: Int
}

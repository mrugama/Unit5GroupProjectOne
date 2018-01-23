//
//  FileManagerHelper.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

class FileManagerHelper {
    private init() {}
    
    static let manager = FileManagerHelper()
    
    //stores the names of the collections
    private var collectionNamesPlist = "CollectionNames.plist"
    
    //stores the venues of each collection
    private var collectionsPlist = "Collections.plist"
    
    private var collectionNames: [String] = [] {
        didSet {
            //should save collection names
        }
    }
    
    private var collections: [[VenueTipModel]] = [] {
        didSet {
            //should save collections and venues
        }
    }
}

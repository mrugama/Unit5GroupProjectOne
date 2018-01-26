//
//  UserPreferences.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

class UserPreferences {
    private init() {}
    
    static let manager = UserPreferences()
    
    private let userDefaults = UserDefaults.standard
    private let userCoordinatesKey = "User Coordinates Key"
    private let searchCoordinatesKey = "Search Coordinates Key"
    
    //save
    public func saveUserCoordinates(latitude: Double, longitude: Double) {
        let userCoordinates: (latitude: Double, longitude: Double) = (latitude, longitude)
        
        userDefaults.set(userCoordinates, forKey: userCoordinatesKey)
    }
    public func saveSearchCoordinates(latitude: Double, longitude: Double) {
        let searchCoordinates: (latitude: Double, longitude: Double) = (latitude, longitude)
        
        userDefaults.set(searchCoordinates, forKey: searchCoordinatesKey)
    }
    //get
    public func getUserCoordinate() -> (latitude: Double, longitude: Double)? {
        return userDefaults.object(forKey: userCoordinatesKey) as? (Double, Double)
    }
    public func getSearchCoordinates() -> (latitude: Double, longitude: Double)? {
        return userDefaults.object(forKey: searchCoordinatesKey) as? (Double, Double)
    }
}

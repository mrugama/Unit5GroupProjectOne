//
//  VenueAPIClient.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/21/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Alamofire
class VenueAPIClient {
    private init() {}
    static let manager = VenueAPIClient()
    func getVenues(lat latitute: Double,
                   lon longitude: Double,
                   completion: @escaping ([Venue]?) -> Void) {
        let urlBase = "https://api.foursquare.com/v2/venues/search"
        let dateFormatted = DateFormatter()
        let date = Date()
        dateFormatted.dateFormat = "yyyyMMdd"
        let strDate = dateFormatted.string(from: date)
        print(strDate)
        let params: [String: Any] = ["ll": "\(latitute),\(longitude)",
            "oauth_token": APIKeys.apiKey,
            "v": strDate]
        
        Alamofire.request(urlBase, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            switch dataResponse.result {
            case .failure(let error):
                print("Response error: \(error.localizedDescription)")
            case .success:
                if let dataError = dataResponse.error {
                    print("Data Error: \(dataError.localizedDescription)")
                } else if let data = dataResponse.data {
                    do {
                        let decoder = JSONDecoder()
                        let results = try decoder.decode(AllVenue.self, from: data)
                        completion(results.responseVenue.venues)
                    } catch let error {
                        print("Data struct error: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}


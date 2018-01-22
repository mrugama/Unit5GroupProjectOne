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
    private let keyAPI = "ZQSWSRCGU33XMP2KNS2BWUNUICV4JJQYQ2NJNUNRTT4SXEZT"
    func getVenues(lat latitute: Double,
                   lon longitude: Double,
                   completion: @escaping ([Venue]?) -> Void) {
        let urlWeather = "https://api.foursquare.com/v2/venues/search?ll=\(latitute),\(longitude)&oauth_token=\(keyAPI)&v=20180118"
        guard let url = URL(string: urlWeather) else {return}
        Alamofire.request(url).responseJSON{ response in
            switch response.result{
            case .success:
                if let data = response.data {
                    do {
                        let result = try JSONDecoder().decode(AllVenue.self, from: data)
                        completion(result.responseVenue.venues)
                    } catch let error {
                        print("Error decoding: \(error.localizedDescription)")
                    }
                }
                
            // MARK: do whatever you want
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


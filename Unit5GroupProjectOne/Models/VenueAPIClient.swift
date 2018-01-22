//
//  VenueAPIClient.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/21/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Alamofire

struct VenueAPIClient {
    private init() {}
    static let manager = VenueAPIClient()
    private let keyAPI = "ZQSWSRCGU33XMP2KNS2BWUNUICV4JJQYQ2NJNUNRTT4SXEZT"
    func getVenue(from urlStr: String,
                  lat latitute: Double,
                  lon longitude: Double,
                    completionHandler: @escaping ([Venue]) -> Void,
                    errorHandler: @escaping (Error) -> Void) {
        let urlWeather = "https://api.foursquare.com/v2/venues/search?ll=\(latitute),\(longitude)&oauth_token=\(keyAPI)&v=20180118"
        guard let url = URL(string: urlWeather) else {return}
        let parseDataVenue = {(data: Data) in
            do {
                let requestVenue = try JSONDecoder().decode(SearchVenue.self, from: data)
                if let getVenue = requestVenue.searchVenue {
                    completionHandler(getVenue.venues)
                } else {
                    errorHandler(AppError.noDataReceived)
                    return
                }
            }
            catch let error {
                errorHandler(AppError.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: parseDataVenue, errorHandler: errorHandler)
    }
}

/*
 do {
 let request = NSURLRequest(URL: NSURL(string: "http://date.jsontest.com/")!)
 let json = try session.awaitJsonWithRequest(request)
 let date = json["date"]
 NSLog("\(date)")
 }
 catch let error as NSError {
 NSLog("\(error.localizedDescription)")
 }
 */


//
//  PhotoAPIClient.swift
//  Unit5GroupProjectOne
//
//  Created by C4Q on 1/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import Alamofire
class PhotoAPIClient {
    private init() {}
    static let manager = PhotoAPIClient()
    private let keyAPI = "ZQSWSRCGU33XMP2KNS2BWUNUICV4JJQYQ2NJNUNRTT4SXEZT"
    func getPhotos(venue venueId: String,
                   completion: @escaping ([Photo]?) -> Void) {
        let urlWeather = "https://api.foursquare.com/v2/venues/\(venueId)/photos?&oauth_token=\(keyAPI)&v=20180118"
        guard let url = URL(string: urlWeather) else {return}
        Alamofire.request(url).responseJSON{ response in
            switch response.result{
            case .success:
                if let data = response.data {
                    do {
                        let result = try JSONDecoder().decode(AllPhotos.self, from: data)
                        completion(result.response.photos.items)
                    } catch let error {
                        print("Error decoding: \(error.localizedDescription)")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

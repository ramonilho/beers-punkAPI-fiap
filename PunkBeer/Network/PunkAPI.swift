//
//  PunkAPI.swift
//  PunkBeer
//
//  Created by Ramon Honorio on 30/11/17.
//  Copyright © 2017 Ramonilho. All rights reserved.
//

import UIKit

class PunkAPI {
    
    static let baseURL = "https://api.punkapi.com/v2/"
    
    // MARK: - Requesting beers
    static func getBeers(page: Int = 1,
                  results: Int = 20,
                  onSuccess: @escaping ([Beer]) -> Void,
                  onFailure: @escaping (Error) -> Void) {
        
        // Building URL
        let url = URL(string: "\(baseURL)/beers?page=\(page)&per_page=\(results)")!
        
        // Initializating dataTask
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Guarding errors
            if error != nil {
                onFailure(error!)
            }
            
            if let resultData = data {
                do {
                    // Parsing data to json
                    let json = try JSONSerialization.jsonObject(with: resultData, options: .allowFragments) as! [[String:Any]]
                    
                    var list = [Beer]()
                    
                    for beerJson in json {
                        
                        let beer = Beer.init(id: beerJson["id"] as? Int ?? 0,
                                             name: beerJson["name"] as? String ?? "",
                                             tagline: beerJson["tagline"] as? String ?? "",
                                             description: beerJson["description"] as? String ?? "",
                                             imageURL: beerJson["image_url"] as? String ?? "",
                                             abv: beerJson["abv"] as? Float ?? 0.0,
                                             ibu: beerJson["ibu"] as? Float ?? 0.0)
                        
                        list.append(beer)
                        
                    }
                    
                    onSuccess(list)
                    
                } catch let e {
                    print("Error while parsing JSON: \(e.localizedDescription)")
                }
                
            }
        }
        
        task.resume()
        
    }
    
}

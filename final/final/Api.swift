//
//  Api.swift
//  final
//
//  Created by LangHui He on 12/6/21.
//

import Foundation


struct Api {
    private static let baseURLString = "https://api.icndb.com/jokes/random/25?limitTo=nerdy"
    
    private static func jokeURL(parameters: [String:String]?) -> URL {
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method" : "GET",
            "format" : "json",
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components.queryItems = queryItems
        
        return components.url!
    }
    
    static var icndbURL: URL {
        return jokeURL(parameters: [:])
    }
    
    static func jokes(fromJSON data: Data) -> Result<[Joke], Error> {
             do {
                 let decoder = JSONDecoder()

                 let icndbResponse = try decoder.decode(icndbResponse.self, from: data)
                 return .success(icndbResponse.jokes)
                 
             } catch {
                 return .failure(error)
             }
         }
}

struct icndbResponse: Codable {
    let jokes:  [Joke]
    enum CodingKeys: String, CodingKey {
            case jokes = "value"
    }
}

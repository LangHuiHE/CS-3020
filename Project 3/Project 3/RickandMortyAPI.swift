//
//  RickandMortyAPI.swift
//  Project 3
//
//  Created by LangHui He on 11/8/21.
//

import Foundation

struct RickandMortyAPI {
    private static let baseURLString = "https://rickandmortyapi.com/api/character"
    
    private static func RickandMortyURL(parameters: [String:String]?) -> URL {
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
    
    static var charactesURL: URL {
        return RickandMortyURL(parameters: [:])
    }
    
    static func characters(fromJSON data: Data) -> Result<[Character], Error> {
             do {
                 let decoder = JSONDecoder()

                 let rickandMortyCharactersResponse = try decoder.decode(RickandMortyCharactersResponse.self, from: data)
                 return .success(rickandMortyCharactersResponse.characters)
                 
             } catch {
                 return .failure(error)
             }
         }
    
}

struct RickandMortyCharactersResponse: Codable {
    // let character: [Character]
    let characters:  [Character]
    enum CodingKeys: String, CodingKey {
            case characters = "results"
    }
}

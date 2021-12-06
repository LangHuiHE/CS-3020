//
//  Jokes.swift
//  final
//
//  Created by LangHui He on 12/6/21.
//

import UIKit

class Joke : Codable {
    let id : Int
    let joke : String
    var author = "Mr. Chuck Norris"
    
    enum CodingKeys: String, CodingKey {
        case id
        case joke
    }
    
}

extension Joke: Equatable {
   static func == (lhs: Joke, rhs: Joke) -> Bool {
       return lhs.id == rhs.id && lhs.joke == rhs.joke && lhs.author == rhs.author
   }
}

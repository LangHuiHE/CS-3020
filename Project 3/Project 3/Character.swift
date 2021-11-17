//
//  Character.swift
//  Project 3
//
//  Created by LangHui He on 11/8/21.
//

import UIKit
class Character : Codable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    // let originName : String
    // let locationName : String
    let imageURL: URL?
    let characterURL: URL
    var characterImage: UIImage?
    
     enum CodingKeys: String, CodingKey {
         case id = "id"
         case name = "name"
         case status = "status"
         case species = "species"
         case gender = "gender"
         // case originName = "orgin"
         // case locationName = ""
         case imageURL = "image"
         case characterURL = "url"
     }
 }

extension Character: Equatable {
   static func == (lhs: Character, rhs: Character) -> Bool {
       return lhs.id == rhs.id && lhs.name == rhs.name && lhs.status == rhs.status && lhs.species == rhs.species && lhs.gender == rhs.gender && lhs.imageURL == rhs.imageURL && lhs.characterURL == rhs.characterURL
   }
}
